import 'package:flutter/material.dart';
import '../veritabani/veritabani.dart';
import 'tarif_detay_ekrani.dart';
import 'tarif_duzenle_ekrani.dart';
import 'tarif_ekle_ekrani.dart';

class KategoriEkrani extends StatefulWidget {
  final String kategoriAdi;

  const KategoriEkrani({super.key, required this.kategoriAdi});

  @override
  _KategoriEkraniState createState() => _KategoriEkraniState();
}

class _KategoriEkraniState extends State<KategoriEkrani> {
  List<Map<String, dynamic>> tarifler = [];

  Future<void> _tarifleriGetir() async {
    final veri = await Veritabani().tarifleriGetir(widget.kategoriAdi);
    setState(() {
      tarifler = veri;
    });
  }

  @override
  void initState() {
    super.initState();
    _tarifleriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kategoriAdi),
        centerTitle: true,
      ),
      body: tarifler.isEmpty
          ? const Center(
        child: Text(
          'Henüz tarif eklenmedi.',
          style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tarifler.length,
        itemBuilder: (context, index) {
          final tarif = tarifler[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12.0),
              leading: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.receipt, color: Colors.white),
              ),
              title: Text(
                tarif['ad'] ?? 'Ad bilgisi yok',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                tarif['malzemeler']?.split('\n').take(2).join('\n') ??
                    'Malzeme bilgisi yok',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    tooltip: 'Düzenle',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TarifDuzenleEkrani(
                            tarifId: tarif['id'],
                            mevcutAd: tarif['ad'] ?? '',
                            mevcutMalzemeler: tarif['malzemeler'] ?? '',
                            mevcutHazirlanis: tarif['hazirlanis'] ?? '',
                            mevcutOneriler: tarif['oneriler'] ?? '',
                          ),
                        ),
                      ).then((_) => _tarifleriGetir());
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Sil',
                    onPressed: () async {
                      bool? onay = await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Tarifi Sil'),
                          content: const Text(
                              'Bu tarifi silmek istediğinizden emin misiniz?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, false),
                              child: const Text('İptal'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, true),
                              child: const Text('Sil'),
                            ),
                          ],
                        ),
                      );
                      if (onay == true) {
                        await Veritabani().tarifSil(tarif['id']);
                        _tarifleriGetir();
                      }
                    },
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TarifDetayEkrani(
                      tarifAdi: tarif['ad'] ?? 'Ad bilgisi yok',
                      malzemeler:
                      tarif['malzemeler'] ?? 'Malzeme bilgisi yok',
                      hazirlanis:
                      tarif['hazirlanis'] ?? 'Hazırlık bilgisi yok',
                      oneriler: tarif['oneriler'] ?? 'Öneri yok',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TarifEkleEkrani(kategoriAdi: widget.kategoriAdi),
            ),
          );
          _tarifleriGetir();
        },
        child: const Icon(Icons.add),
        tooltip: 'Tarif Ekle',
      ),
    );
  }
}
