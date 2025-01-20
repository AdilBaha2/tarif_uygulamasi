import 'package:flutter/material.dart';

class KategoriEkleEkrani extends StatefulWidget {
  const KategoriEkleEkrani({super.key});

  @override
  _KategoriEkleEkraniState createState() => _KategoriEkleEkraniState();
}

class _KategoriEkleEkraniState extends State<KategoriEkleEkrani> {
  final TextEditingController _isimController = TextEditingController();

  final List<IconData> ikonlar = [
    Icons.soup_kitchen,
    Icons.restaurant,
    Icons.cake,
    Icons.food_bank,
    Icons.local_drink,
    Icons.fastfood,
    Icons.local_pizza,
    Icons.brunch_dining,
  ];

  final List<Color> renkler = [
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.brown,
    Colors.teal,
  ];

  IconData _secilenIkon = Icons.category;
  Color _secilenRenk = Colors.grey;

  void _ikonSec() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bir ikon seçin'),
        content: SizedBox(
          height: 200,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: ikonlar.length,
            itemBuilder: (context, index) {
              return IconButton(
                icon: Icon(ikonlar[index], size: 30),
                onPressed: () {
                  setState(() {
                    _secilenIkon = ikonlar[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _renkSec() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bir renk seçin'),
        content: SizedBox(
          height: 200,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: renkler.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _secilenRenk = renkler[index];
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: renkler[index],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12),
                  ),
                  width: 40,
                  height: 40,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _kaydet() {
    if (_isimController.text.isNotEmpty) {
      Navigator.pop(context, {
        'kategoriAdi': _isimController.text,
        'ikon': _secilenIkon,
        'renk': _secilenRenk,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _isimController,
              decoration: const InputDecoration(
                labelText: 'Kategori İsmi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Seçilen İkon:'),
                    Icon(_secilenIkon, size: 36),
                  ],
                ),
                ElevatedButton(
                  onPressed: _ikonSec,
                  child: const Text('İkon Seç'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Seçilen Renk:'),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _secilenRenk,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _renkSec,
                  child: const Text('Renk Seç'),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _kaydet,
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}