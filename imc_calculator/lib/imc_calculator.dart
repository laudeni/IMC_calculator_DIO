import 'dart:io';

import 'package:imc_calculator/classes/pessoa.dart';
import 'package:imc_calculator/utils/console_utils.dart';

void menu() {
  Pessoa pessoa = Pessoa();
  double? resp;
  String? escolha;
  //Menu básico usando Switch Case
  print("**********************************************************");
  print("****************BEM VINDO AO IMC TEST V1.0****************");
  print("**********************************************************");
  print("\nDigite uma opção abaixo:");
  print("\n1 - Calcular");
  print("\n2 - Sobre");
  print("\n3 - Sair do Programa\n");

  do {
    escolha = stdin.readLineSync();
    if ((escolha != '1') && (escolha != '2') && (escolha != '3')) {
      // ConsoleUtils().clearScreen(true);?
      print("Opção inválida, digite outra opção!");
    }
    switch (escolha) {
      case '1': //Aqui é onde fica o menu do calculo
        //Cria um loop caso o usuario deseje fazer um novo calculo
        do {
          //Limpa Tela
          for (int i = 0; i < stdout.terminalLines; i++) {
            stdout.writeln();
          }
          print('****************CALCULAR IMC****************');
          pessoa.nome = ConsoleUtils.lerStringComTexto(
              "Digite os valores abaixo:\n\nDigite Seu Nome: ");
          pessoa.peso = ConsoleUtils.lerDoubleComTexto("Digite Seu Peso: ");
          //Cria um loop para tentar evitar que a altura seja digitada incorretamente
          do {
            pessoa.altura = ConsoleUtils.lerDoubleComTexto(
                "Digite Sua Altura em centimetros!\n## Exemplo: 1.60 que equivale a 1 metro e 60cm ##");
            if ((pessoa.altura > 3) || (pessoa.altura == null)) {
              print("Você Digitou uma altura inválida!\nTente Novamente.");
            }
          } while (pessoa.altura > 3 && pessoa.altura == null);
          print("\n\n****************RESULTADO!******************");
          print("\nOlá ${pessoa.nome}");
          Pessoa().resultadoIMC(pessoa.peso, pessoa.altura);
          resp = ConsoleUtils.lerDoubleComTextoComSaida(
              "\nDigite 1 para fazer um novo calculo ou s para voltar ao menu principal",
              "s");
        } while (resp != null && resp == 1);
        //Limpa Tela
        for (int i = 0; i < stdout.terminalLines; i++) {
          stdout.writeln();
        }
        menu(); //chama o menu
        break;

      case '2': //Menu sobre
        //Limpa Tela
        for (int i = 0; i < stdout.terminalLines; i++) {
          stdout.writeln();
        }
        print('****************SOBRE****************\n');
        print(
            "Calculadora de IMC.\nDesenvolvida por Laudeni Alves\nProjeto para DIO, Bootcamp Santander 2023");
        print('\n****************Versão 1.0****************');
        resp = ConsoleUtils.lerDoubleComTextoComSaida(
            "\nDigite 1 para Sair ou 0 para voltar ao menu principal", "3");
        if (resp == 1) {
          exit(0);
        } else {
          //Limpa Tela
          for (int i = 0; i < stdout.terminalLines; i++) {
            stdout.writeln();
          }
          menu();
        }
        break;

      case '3': //Encerra aplicação
        print('Encerrando aplicação...\nAté a proxima!');
        break;
      default:
    } //fim Switch
  } while ((escolha != '1') && (escolha != '2') && (escolha != '3'));
}
