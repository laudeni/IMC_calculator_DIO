import 'dart:convert';
import 'dart:io';

import 'package:imc_calculator/classes/pessoa.dart';
import 'package:imc_calculator/utils/console_utils.dart';

void menu() {
  Pessoa pessoa = Pessoa();

  //Menu básico usando Switch Case
  print("Bem Vindo ao ICM Test v1.0");
  print("\nDigite uma opção abaixo:");
  print("\n1 - Calcular");
  print("\n2 - sobre");
  print("\n0 - Sair do Programa\n");
  var escolha = stdin.readLineSync(encoding: utf8);

  switch (escolha) {
    case '1': //Aqui é onde fica o menu do calculo
      double? resp;
      //Cria um loop caso o usuario deseje fazer um novo calculo
      do {
        for (int i = 0; i < stdout.terminalLines; i++) {
          stdout.writeln();
        }
        print('Menu Calcular');
        pessoa.nome = ConsoleUtils.lerStringComTexto(
            "Digite os valores abaixo:\n\nDigite Seu Nome: ");
        pessoa.peso = ConsoleUtils.lerDoubleComTexto("Digite Seu Peso: ");

        //Cria um loop para tentar evitar que a altura seja digitada incorretamente
        do {
          pessoa.altura = ConsoleUtils.lerDoubleComTexto(
              "Digite Sua Altura em centimetros!\n## Exemplo: 1.60 que equivale a 1 metro e 60cm ##");
          if (pessoa.altura > 3) {
            print("Você Digitou uma altura inválida!\nTente Novamente.");
          }
        } while (pessoa.altura > 3);

        print("\n\n**********************************");
        print("Resultado!\nOlá ${pessoa.nome}");
        Pessoa().resultadoIMC(
            pessoa.peso, pessoa.altura); //Chama o resultado do calculo
        resp = ConsoleUtils.lerDoubleComTextoComSaida(
            "Digite 1 para fazer um novo calculo ou 0 para voltar ao menu principal",
            "0");
      } while (resp == 1);
      for (int i = 0; i < stdout.terminalLines; i++) {
        stdout.writeln();
      }
      menu();

      break;
    case '2':
      for (int i = 0; i < stdout.terminalLines; i++) {
        stdout.writeln();
      }
      print('*******SOBRE*******\n');
      print("Calculadora de IMC, desenvolvida por Laudeni Alves");
      print('\n*******Versão 1.0*******');
      break;
    case '0':
      print('Encerrando aplicação...\nAté a proxima!');
      break;
    default:
      print('Opção inválida');
  }
}
