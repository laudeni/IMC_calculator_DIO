import 'package:imc_calculator/classes/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('imc', () {
    expect(Pessoa().resultadoIMC(50, 1.9), '13.850415512465375');
  });
}
