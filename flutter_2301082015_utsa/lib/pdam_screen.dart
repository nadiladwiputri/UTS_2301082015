import 'package:flutter/material.dart';
import 'pdam.dart';

class PdamScreen extends StatefulWidget {
  @override
  _PdamScreenState createState() => _PdamScreenState();
}

class _PdamScreenState extends State<PdamScreen> {
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _jenisController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _meterIniController = TextEditingController();
  final _meterLaluController = TextEditingController();

  String? _result;

  void _calculateTotal() {
    final pdam = Pdam(
      kodePembayaran: _kodeController.text,
      namaPelanggan: _namaController.text,
      jenisPelanggan: _jenisController.text.toUpperCase(),
      tanggal: _tanggalController.text,
      meterBulanIni: int.parse(_meterIniController.text),
      meterBulanLalu: int.parse(_meterLaluController.text),
    );

    setState(() {
      pdam.hitungTotalBayar();

      // Format all the information and result
      _result = '''
        Kode Pembayaran: ${pdam.kodePembayaran}
        Nama Pelanggan: ${pdam.namaPelanggan}
        Jenis Pelanggan: ${pdam.jenisPelanggan}
        Tanggal: ${pdam.tanggal}
        Meter Bulan Ini: ${pdam.meterBulanIni}
        Meter Bulan Lalu: ${pdam.meterBulanLalu}
        Meter Pakai: ${pdam.hitungMeterPakai()}
        Total Bayar: Rp ${pdam.totalBayar}
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDAM Billing App'),
      ),
      body: SingleChildScrollView(  // Added this to enable scrolling
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            TextField(
              controller: _kodeController,
              decoration: InputDecoration(labelText: 'Kode Pembayaran'),
            ),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Pelanggan'),
            ),
            TextField(
              controller: _jenisController,
              decoration: InputDecoration(labelText: 'Jenis Pelanggan (GOLD, SILVER, UMUM)'),
            ),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal'),
            ),
            TextField(
              controller: _meterIniController,
              decoration: InputDecoration(labelText: 'Meter Bulan Ini'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _meterLaluController,
              decoration: InputDecoration(labelText: 'Meter Bulan Lalu'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: Text('Hitung Total Bayar'),
            ),
            SizedBox(height: 20),
            if (_result != null)
              Text(
                _result!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}