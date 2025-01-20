import 'package:flutter/material.dart';
import '../veritabani/veritabani.dart';

class TarifEkleEkrani extends StatefulWidget {
  final String kategoriAdi;

  const TarifEkleEkrani({super.key, required this.kategoriAdi});

  @override
  _TarifEkleEkraniState createState() => _TarifEkleEkraniState();
}

class _TarifEkleEkraniState extends State<TarifEkleEkrani> {
  final _adController = TextEditingController();
  final _malzemelerController = TextEditingController();
  final _hazirlanisController = TextEditingController();
  final _onerilerController = TextEditingController();

  @override
  void dispose() {
    // Bellek sızıntısını önlemek için controller'ları temizliyoruz
    _adController.dispose();
    _malzemelerController.dispose();
    _hazirlanisController.dispose();
    _onerilerController.dispose();
    super.dispose();
  }

  Future<void> _tarifKaydet() async {
    if (_adController.text.isNotEmpty &&
        _malzemelerController.text.isNotEmpty &&
        _hazirlanisController.text.isNotEmpty) {
      try {
        await Veritabani().tarifEkle(
          widget.kategoriAdi,
          _adController.text,
          _malzemelerController.text,
          _hazirlanisController.text,
          _onerilerController.text,
        );
        Navigator.pop(context); // Başarılı bir şekilde ekrana geri dön
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tarif başarıyla kaydedildi!')),
        );
      } catch (e) {
        // Hata durumunda kullanıcıyı bilgilendir
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bir hata oluştu: $e')),
        );
      }
    } else {
      // Eksik bilgi uyarısı
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.kategoriAdi} - Tarif Ekle'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tarif Adı (Başlık):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _adController,
                hintText: 'Tarif adını girin',
              ),
              const SizedBox(height: 16),

              const Text(
                'Malzemeler (Her satıra bir malzeme ekleyin):',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _malzemelerController,
                hintText: 'Malzemeleri girin',
                maxLines: 5,
              ),
              const SizedBox(height: 16),

              const Text(
                'Hazırlık Aşamaları:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _hazirlanisController,
                hintText: 'Hazırlık adımlarını girin',
                maxLines: 5,
              ),
              const SizedBox(height: 16),

              const Text(
                'En Son Öneri:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _onerilerController,
                hintText: 'Önerinizi girin',
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              Center(
                child: ElevatedButton.icon(
                  onPressed: _tarifKaydet,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Kaydet',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
      ),
    );
  }
}
