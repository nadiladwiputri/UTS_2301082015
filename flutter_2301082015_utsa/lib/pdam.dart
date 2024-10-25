class Pdam {
  String kodePembayaran;
  String namaPelanggan;
  String jenisPelanggan;
  String tanggal;
  int meterBulanIni;
  int meterBulanLalu;
  int totalBayar = 0;

  Pdam({
    required this.kodePembayaran,
    required this.namaPelanggan,
    required this.jenisPelanggan,
    required this.tanggal,
    required this.meterBulanIni,
    required this.meterBulanLalu,
  });

  // Calculate meter usage
  int hitungMeterPakai() {
    return (meterBulanIni - meterBulanLalu).abs();
  }

  // Calculate total payment based on jenisPelanggan and meterPakai
  int hitungTotalBayar() {
    int meterPakai = hitungMeterPakai();
    int biayaPerMeter = 0;

    if (jenisPelanggan == 'GOLD') {
      if (meterPakai >= 1 && meterPakai <= 10) {
        biayaPerMeter = 5000;
      } else if (meterPakai >= 11 && meterPakai <= 20) {
        biayaPerMeter = 10000;
      } else {
        biayaPerMeter = 20000;
      }
    } else if (jenisPelanggan == 'SILVER') {
      if (meterPakai >= 1 && meterPakai <= 10) {
        biayaPerMeter = 4000;
      } else if (meterPakai >= 11 && meterPakai <= 20) {
        biayaPerMeter = 8000;
      } else {
        biayaPerMeter = 10000;
      }
    } else if (jenisPelanggan == 'UMUM') {
      if (meterPakai >= 1 && meterPakai <= 10) {
        biayaPerMeter = 2000;
      } else if (meterPakai >= 11 && meterPakai <= 20) {
        biayaPerMeter = 3000;
      } else {
        biayaPerMeter = 5000;
      }
    }

    totalBayar = meterPakai * biayaPerMeter;
    return totalBayar;
  }
}