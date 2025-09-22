import 'dart:io';

void main() {
  List<Map<String, dynamic>> riwayat = [];

  print("=== Program Kalkulator BMI ===");
  print("Ketik 'exit' pada input tinggi untuk keluar.\n");

  while (true) {
    // Input tinggi
    stdout.write("Masukkan tinggi (cm): ");
    String? inputTinggi = stdin.readLineSync();
    if (inputTinggi == null || inputTinggi.toLowerCase() == 'exit') break;

    // Input berat
    stdout.write("Masukkan berat (kg): ");
    String? inputBerat = stdin.readLineSync();
    if (inputBerat == null || inputBerat.toLowerCase() == 'exit') break;

    // Konversi input
    double? tinggi = double.tryParse(inputTinggi);
    double? berat = double.tryParse(inputBerat);

    // Validasi input
    if (tinggi == null || berat == null || tinggi <= 0 || berat <= 0) {
      print("⚠️ Input tidak valid! Pastikan tinggi & berat berupa angka positif.\n");
      continue;
    }

    // Hitung BMI
    double tinggiM = tinggi / 100;
    double bmi = berat / (tinggiM * tinggiM);

    // Tentukan kategori
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

    // Simpan ke riwayat
    riwayat.add({
      'tinggi': tinggi,
      'berat': berat,
      'bmi': bmi.toStringAsFixed(2),
      'kategori': kategori,
    });

    // Tampilkan hasil langsung
    print("=> BMI Anda: ${bmi.toStringAsFixed(2)} → $kategori\n");
  }

  // Tampilkan seluruh riwayat
  if (riwayat.isNotEmpty) {
    print("\n===== Riwayat Perhitungan BMI =====");
    for (var data in riwayat) {
      print("Tinggi: ${data['tinggi']} cm, Berat: ${data['berat']} kg, "
            "BMI: ${data['bmi']} → ${data['kategori']}");
    }
  }

  print("\nTerima kasih sudah menggunakan kalkulator BMI!");
}
