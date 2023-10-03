class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  List tabelaIMC = [""];

  get nome => _nome;

  set nome(value) => _nome = value;

  get peso => _peso;

  set peso(value) => _peso = value;

  get altura => _altura;

  set altura(value) => _altura = value;

  void resultadoIMC(double peso, altura) {
    var imc = peso / (altura * altura);
    switch (imc) {
      case < 16:
        print(
            "Seu IMC é de: $imc \nVocê apresenta Magreza Grave\nRecomendamos que busque auxilio de um profissional qualificado!");
        break;
      case > 16.0 && < 17.0:
        print(
            "Seu IMC é de: $imc \nVocê apresenta Magreza Moderada\nRecomendamos que busque auxilio de um profissional qualificado!");
        break;
      case > 17 && < 18.5:
        print("Seu IMC é de: $imc \nVocê apresenta Magreza Leve");
        break;
      case > 18.5 && < 25:
        print("Seu IMC é de: $imc \nVocê está Saúdavel");
        break;
      case > 25 && < 30:
        print("Seu IMC é de: $imc \nVocê apresenta Sobrepeso");
        break;
      case > 30 && < 25:
        print(
            "Seu IMC é de: $imc \nVocê apresenta Obsesidade Grau I\nRecomendamos que busque auxilio de um profissional qualificado!");
        break;
      case > 25 && > 30:
        print(
            "Seu IMC é de: $imc \nVocê apresenta Obsesidade Grau II (Severa)\nRecomendamos que busque auxilio de um profissional qualificado!");
        break;
      case > 40:
        print(
            "Seu IMC é de: $imc \nVocê apresenta Obsesidade Grau III (Grave)\nRecomendamos que busque auxilio de um profissional qualificado!");
        break;
      default:
        print(
            "Valores inseridos inválidos, insira corretamente da proxima vez!!!");
    }
  }
}
