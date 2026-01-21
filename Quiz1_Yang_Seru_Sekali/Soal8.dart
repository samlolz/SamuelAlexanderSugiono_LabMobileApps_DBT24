import 'dart:io';

bool isPerfectNumber(int n) {
  int sum = 0;

  for (int i = 1; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      sum += i;
    }
  }

  return sum == n;
}

void main() {
  print("Input:");
  int number = int.parse(stdin.readLineSync()!);

  print("Output:");
  print(isPerfectNumber(number));
}