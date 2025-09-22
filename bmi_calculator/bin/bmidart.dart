void hitungBMI(double tinggiCm, double beratKg, List<Map<String, dynamic>> riwayat) {
  if (tinggiCm <= 0 || beratKg <= 0) {
    print("Error: Tinggi dan berat harus lebih dari 0.");
    return;
  }
  if (tinggiCm < 50) {
    print("Error: Tinggi terlalu kecil untuk dihitung.");
    return;
  }
  if (beratKg < 2) {
    print("Error: Berat terlalu kecil untuk dihitung.");
    return;
  }

  double tinggiM = tinggiCm / 100;
  double bmi = beratKg / (tinggiM * tinggiM);

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
}