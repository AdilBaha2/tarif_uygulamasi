import 'package:flutter/material.dart';

class TarifDetayEkrani extends StatelessWidget {
  final String tarifAdi;
  final String malzemeler;
  final String hazirlanis;
  final String oneriler;

  const TarifDetayEkrani({
    super.key,
    required this.tarifAdi,
    required this.malzemeler,
    required this.hazirlanis,
    required this.oneriler,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tarifAdi),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Malzemeler:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(malzemeler),
              const Divider(),
              Text(
                'Hazırlık Aşamaları:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(hazirlanis),
              const Divider(),
              Text(
                'Öneriler:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(oneriler),
            ],
          ),
        ),
      ),
    );
  }
}