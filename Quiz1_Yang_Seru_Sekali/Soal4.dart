import 'dart:io';

bool isPrime(int number) {
  if (number <= 1) return false;

  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.write('Masukkan sebuah angka: ');
  int? input = int.tryParse(stdin.readLineSync()!);

  if (input == null) {
    print('Input tidak valid');
    return;
  }

  if (isPrime(input)) {
    print('$input adalah bilangan prima.');
  } else {
    print('$input bukan bilangan prima.');
  }
}
