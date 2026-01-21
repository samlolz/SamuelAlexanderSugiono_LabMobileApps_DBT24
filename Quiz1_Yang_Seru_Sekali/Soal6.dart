class Account {
  int balance;

  Account(this.balance);
  void deposit(int amount) {
    balance += amount;
  }

  void withdraw(int amount) {
    if (balance - amount >= 0) {
      balance -= amount;
    }
  }
}

void main() {
  Account acc = Account(1000);
  acc.deposit(500);
  acc.withdraw(300);

  print('Saldo akhir: ${acc.balance}');
}