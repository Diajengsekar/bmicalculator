import 'dart:io';

void main() {
  List<Map<String, dynamic>> riwayat = [];

  print("=== Program Kalkulator BMI ===");
  print("Ketik 'exit' pada input tinggi untuk keluar.\n");

  while (true) {
    stdout.write("Masukkan tinggi (cm): ");
    String? inputTinggi = stdin.readLineSync();
    if (inputTinggi == null || inputTinggi.toLowerCase() == 'exit') break;

    stdout.write("Masukkan berat (kg): ");
    String? inputBerat = stdin.readLineSync();
    if (inputBerat == null || inputBerat.toLowerCase() == 'exit') break;

    double? tinggi = double.tryParse(inputTinggi);
    double? berat = double.tryParse(inputBerat);

    if (tinggi == null || berat == null || tinggi <= 0 || berat <= 0) {
      print("⚠️ Input tidak valid! Tinggi & berat harus angka positif.\n");
      continue;
    }

    double bmi = hitungBMI(tinggi, berat);

    String kategori;
    if (bmi < 18.5) {
      kategori = "Kurus";
    } else if (bmi < 25) {
      kategori = "Normal";
    } else if (bmi < 30) {
      kategori = "Gemuk";
    } else {
      kategori = "Obesitas";
    }

    riwayat.add({
      'tinggi': tinggi,
      'berat': berat,
      'bmi': bmi.toStringAsFixed(2),
      'kategori': kategori,
    });

    print("=> BMI Anda: ${bmi.toStringAsFixed(2)} → $kategori\n");
  }

  if (riwayat.isNotEmpty) {
    print("\n===== Riwayat Perhitungan BMI =====");
    for (var data in riwayat) {
      print("Tinggi: ${data['tinggi']} cm, Berat: ${data['berat']} kg, "
          "BMI: ${data['bmi']} → ${data['kategori']}");
    }
  }

  print("\nTerima kasih sudah menggunakan kalkulator BMI!");
}

double hitungBMI(double tinggiCm, double beratKg) {
  double tinggiM = tinggiCm / 100;
  return beratKg / (tinggiM * tinggiM);
}
