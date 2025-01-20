import 'package:flutter/material.dart';
import 'kategori_ekrani.dart';
import 'kategori_ekle_ekrani.dart'; // Yeni kategori ekleme ekranı

class BenimTariflerimEkrani extends StatefulWidget {
  const BenimTariflerimEkrani({super.key});

  @override
  _BenimTariflerimEkraniState createState() => _BenimTariflerimEkraniState();
}

class _BenimTariflerimEkraniState extends State<BenimTariflerimEkrani> {
  // Kategoriler Listesi
  final List<Map<String, dynamic>> kategoriler = [
    {
      'kategoriAdi': 'Çorbalar',
      'ikon': Icons.soup_kitchen,
      'renk': Colors.orange,
    },
    {
      'kategoriAdi': 'Ara Sıcaklar',
      'ikon': Icons.local_fire_department,
      'renk': Colors.red,
    },
    {
      'kategoriAdi': 'Ana Yemekler',
      'ikon': Icons.restaurant,
      'renk': Colors.green,
    },
    {
      'kategoriAdi': 'Tatlılar',
      'ikon': Icons.cake,
      'renk': Colors.pink,
    },
    {
      'kategoriAdi': 'İçecekler',
      'ikon': Icons.local_drink,
      'renk': Colors.blue,
    },
  ];

  void _kategoriEkle(Map<String, dynamic> yeniKategori) {
    setState(() {
      kategoriler.add(yeniKategori);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benim Tariflerim'),
        centerTitle: true,
        backgroundColor: Colors.amber.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        itemCount: kategoriler.length,
        itemBuilder: (context, index) {
          final kategori = kategoriler[index];
          return KategoriKart(
            kategoriAdi: kategori['kategoriAdi'],
            ikon: kategori['ikon'],
            renk: kategori['renk'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber.shade700,
        onPressed: () async {
          final yeniKategori = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KategoriEkleEkrani(),
            ),
          );
          if (yeniKategori != null) {
            _kategoriEkle(yeniKategori);
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Kategori Ekle'),
      ),
    );
  }
}

class KategoriKart extends StatelessWidget {
  final String kategoriAdi; // Kategori ismi
  final IconData ikon; // Kategori simgesi
  final Color renk; // Kategori simge rengi

  const KategoriKart({
    super.key,
    required this.kategoriAdi,
    required this.ikon,
    required this.renk,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 6.0, // Kart gölgesi
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Yuvarlatılmış kenarlar
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24.0,
          backgroundColor: renk.withOpacity(0.2),
          child: Icon(
            ikon,
            color: renk,
            size: 28.0,
          ),
        ),
        title: Text(
          kategoriAdi,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20.0,
          color: Colors.grey,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KategoriEkrani(kategoriAdi: kategoriAdi),
            ),
          );
        },
      ),
    );
  }
}
