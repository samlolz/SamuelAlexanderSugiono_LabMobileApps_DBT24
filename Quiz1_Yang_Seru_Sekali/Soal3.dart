import 'dart:io';
import 'dart:math';

void main ()
{
 Random random = Random();
 int angka = random.nextInt(100) + 1;
 int percobaan = 0;
 int tebakan = 0;
  print ('Coba tebak dari 1 sampai 100!');

  while (tebakan != angka) {
    stdout.write('Masukkan tebakanmu: ');
    tebakan = int.parse(stdin.readLineSync()!);
    percobaan++;

    if (tebakan < angka) {
      print('Tebakanmu terlalu rendah!');
    } else if (tebakan > angka) {
      print('Tebakanmu terlalu tinggi!');
    } else {
      print('Selamat! Kamu menebak dengan benar dalam $percobaan percobaan.');
    }
  }

}