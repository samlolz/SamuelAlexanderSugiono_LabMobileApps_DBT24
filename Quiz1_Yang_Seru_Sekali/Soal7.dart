void main() {
  List<int> a = [1, 3, 5, 7];
  List<int> b = [2, 4, 6, 8];

  List<int> gabungan = [...a, ...b];

  gabungan.sort();

  int maxValue = gabungan.reduce((x, y) => x > y ? x : y);

  print(gabungan);
  print(maxValue);
}