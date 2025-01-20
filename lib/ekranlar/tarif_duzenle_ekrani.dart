import 'package:flutter/material.dart';
import '../veritabani/veritabani.dart';

class TarifDuzenleEkrani extends StatefulWidget {
  final int tarifId;
  final String mevcutAd;
  final String mevcutMalzemeler;
  final String mevcutHazirlanis;
  final String mevcutOneriler;

  const TarifDuzenleEkrani({
    super.key,
    required this.tarifId,
    required this.mevcutAd,
    required this.mevcutMalzemeler,
    required this.mevcutHazirlanis,
    required this.mevcutOneriler,
  });

  @override
  _TarifDuzenleEkraniState createState() => _TarifDuzenleEkraniState();
}

class _TarifDuzenleEkraniState extends State<TarifDuzenleEkrani> {
  late TextEditingController _adController;
  late TextEditingController _malzemelerController;
  late TextEditingController _hazirlanisController;
  late TextEditingController _onerilerController;

  @override
  void initState() {
    super.initState();
    _adController = TextEditingController(text: widget.mevcutAd);
    _malzemelerController = TextEditingController(text: widget.mevcutMalzemeler);
    _hazirlanisController = TextEditingController(text: widget.mevcutHazirlanis);
    _onerilerController = TextEditingController(text: widget.mevcutOneriler);
  }

  @override
  void dispose() {
    _adController.dispose();
    _malzemelerController.dispose();
    _hazirlanisController.dispose();
    _onerilerController.dispose();
    super.dispose();
  }

  Future<void> _tarifiGuncelle() async {
    if (_adController.text.isNotEmpty &&
        _malzemelerController.text.isNotEmpty &&
        _hazirlanisController.text.isNotEmpty) {
      await Veritabani().tarifGuncelle(
        widget.tarifId,
        _adController.text,
        _malzemelerController.text,
        _hazirlanisController.text,
        _onerilerController.text,
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarifi Düzenle'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tarif Adı:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                controller: _adController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tarif adını girin',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Malzemeler:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                controller: _malzemelerController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Malzemeleri girin',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Hazırlık Aşamaları:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                controller: _hazirlanisController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hazırlık adımlarını girin',
                ),
              ),
              const SizedBox(height: 16),
              const Text('En Son Öneri:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                controller: _onerilerController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Önerinizi girin',
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _tarifiGuncelle,
                  child: const Text('Güncelle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
