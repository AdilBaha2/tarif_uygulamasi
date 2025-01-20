import 'package:flutter/material.dart';
import 'tarif_detay_ekrani.dart';

final Map<String, Map<String, dynamic>> hazirTarifKategorileri = {
  'Çorbalar': {
    'ikon': Icons.soup_kitchen,
    'tarifler': [
      {
        'ad': 'Mercimek Çorbası',
        'malzemeler': '''
- 1 su bardağı kırmızı mercimek
- 1 adet orta boy soğan
- 1 adet orta boy havuç
- 1 adet küçük patates
- 2 yemek kaşığı sıvı yağ
- 1 yemek kaşığı tereyağı
- 1 yemek kaşığı un
- 6 su bardağı su
- Tuz, karabiber, kırmızı toz biber
''',
        'hazirlanis': '''
- Malzemeleri hazırlayın, sebzeleri doğrayın.
- Tencerede un ve yağ karışımını kavurun.
- Soğan, havuç, patates ekleyip karıştırın.
- Mercimeği ve suyu ekleyerek pişirin.
- Blenderdan geçirin, baharat ekleyin.
''',
        'oneriler': 'Limon ve kırmızı biberle servis yapabilirsiniz.',
      },
      {
        'ad': 'Tarhana Çorbası',
        'malzemeler': '''
- 2 yemek kaşığı tarhana
- 2 yemek kaşığı sıvı yağ
- 1 yemek kaşığı domates salçası
- 5 su bardağı su
- Tuz, nane
''',
        'hazirlanis': '''
- Tarhanayı suda açın.
- Tencerede salçayı yağla kavurun.
- Tarhanayı ve suyu ekleyerek kaynatın.
- Baharat ekleyip sıcak servis yapın.
''',
        'oneriler': 'Kıtır ekmeklerle servis edebilirsiniz.',
      },
    ],
  },
  'Ara Sıcaklar': {
    'ikon': Icons.local_fire_department,
    'tarifler': [
      {
        'ad': 'Sigara Böreği',
        'malzemeler': '''
- 3 adet yufka
- 200 gr beyaz peynir
- 1 tutam maydanoz
- Kızartmak için sıvı yağ
''',
        'hazirlanis': '''
- Yufkaları üçgen şekilde kesin.
- İçine peynir ve maydanoz karışımını koyup sarın.
- Kızgın yağda kızartın.
''',
        'oneriler': 'Sıcak servis yapın.',
      },
      {
        'ad': 'Paçanga Böreği',
        'malzemeler': '''
- 3 adet yufka
- 200 gr pastırma
- 200 gr kaşar peyniri
- 1 adet domates
- Kızartmak için sıvı yağ
''',
        'hazirlanis': '''
- Yufkaları üçgen kesin, içine pastırma ve kaşar ekleyin.
- Domates dilimleri ekleyip sarın.
- Kızgın yağda kızartarak sıcak servis edin.
''',
        'oneriler': 'Yoğurt ile birlikte servis edebilirsiniz.',
      },
    ],
  },
  'Ana Yemekler': {
    'ikon': Icons.restaurant,
    'tarifler': [
      {
        'ad': 'Karnıyarık',
        'malzemeler': '''
- 4 adet patlıcan
- 200 gr kıyma
- 1 adet soğan
- 2 diş sarımsak
- 2 yemek kaşığı salça
- Tuz, karabiber
''',
        'hazirlanis': '''
- Patlıcanları kızartın, içlerini doldurun.
- Kıymalı harcı hazırlayıp doldurun.
- Fırında pişirerek servis edin.
''',
        'oneriler': 'Pilav ile servis yapabilirsiniz.',
      },
      {
        'ad': 'Fırında Tavuk',
        'malzemeler': '''
- 1 adet bütün tavuk
- 2 yemek kaşığı zeytinyağı
- 1 tatlı kaşığı kekik
- 1 tatlı kaşığı pul biber
- Tuz
''',
        'hazirlanis': '''
- Tavuğu marine edip fırın tepsisine yerleştirin.
- Önceden ısıtılmış fırında 200 derecede pişirin.
''',
        'oneriler': 'Yanına fırında patates ekleyebilirsiniz.',
      },
    ],
  },
  'Tatlılar': {
    'ikon': Icons.cake,
    'tarifler': [
      {
        'ad': 'Sütlaç',
        'malzemeler': '''
- 1 litre süt
- 1 çay bardağı pirinç
- 1 su bardağı şeker
- 1 paket vanilin
''',
        'hazirlanis': '''
- Pirinci haşlayın ve sütü ekleyin.
- Şeker ve vanilini ilave edip karıştırın.
- Orta ateşte pişirerek soğutun.
''',
        'oneriler': 'Tarçın ekleyerek servis yapabilirsiniz.',
      },
      {
        'ad': 'İrmik Helvası',
        'malzemeler': '''
- 1 su bardağı irmik
- 1 su bardağı süt
- 1 su bardağı şeker
- 2 yemek kaşığı tereyağı
''',
        'hazirlanis': '''
- Tereyağını eritip irmiği kavurun.
- Şekerli sütü ekleyip karıştırarak pişirin.
''',
        'oneriler': 'Dondurma ile servis edebilirsiniz.',
      },
    ],
  },
  'İçecekler': {
    'ikon': Icons.local_drink,
    'tarifler': [
      {
        'ad': 'Limonata',
        'malzemeler': '''
- 3 adet limon
- 1 su bardağı toz şeker
- 1 litre su
''',
        'hazirlanis': '''
- Limonları sıkarak suyunu çıkarın.
- Şeker ve suyla karıştırın, buzdolabında soğutun.
''',
        'oneriler': 'Nane yapraklarıyla servis yapabilirsiniz.',
      },
      {
        'ad': 'Meyveli Smoothie',
        'malzemeler': '''
- 1 su bardağı yoğurt
- 1 muz
- 1 çay bardağı çilek
- 1 tatlı kaşığı bal
''',
        'hazirlanis': '''
- Tüm malzemeleri blenderdan geçirin.
- Soğuk olarak servis edin.
''',
        'oneriler': 'Üzerine fındık parçaları ekleyebilirsiniz.',
      },
    ],
  },
};

class HazirTariflerEkrani extends StatelessWidget {
  const HazirTariflerEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hazır Tarifler'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: hazirTarifKategorileri.keys.length,
        itemBuilder: (context, index) {
          final kategoriAdi = hazirTarifKategorileri.keys.elementAt(index);
          final kategori = hazirTarifKategorileri[kategoriAdi]!;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Icon(
                  kategori['ikon'],
                  color: Colors.orange,
                ),
              ),
              title: Text(
                kategoriAdi,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KategoriTarifEkrani(
                      kategoriAdi: kategoriAdi,
                      tarifler: kategori['tarifler'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class KategoriTarifEkrani extends StatelessWidget {
  final String kategoriAdi;
  final List<Map<String, dynamic>> tarifler;

  const KategoriTarifEkrani({
    super.key,
    required this.kategoriAdi,
    required this.tarifler,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kategoriAdi),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tarifler.length,
        itemBuilder: (context, index) {
          final tarif = tarifler[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: Text(
                tarif['ad']!,
                style: const TextStyle(fontSize: 18.0),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TarifDetayEkrani(
                      tarifAdi: tarif['ad']!,
                      malzemeler: tarif['malzemeler']!,
                      hazirlanis: tarif['hazirlanis']!,
                      oneriler: tarif['oneriler']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
