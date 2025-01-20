import 'package:flutter/material.dart';
import 'hazir_tarifler_ekrani.dart';
import 'benim_tariflerim_ekrani.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF8E1), Color(0xFFFFE0B2)], // Degrade arka plan
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'MUTFAK DEFTERİ',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6A1B9A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              _buildButton(
                context,
                label: 'Hazır Tarifler',
                icon: Icons.book,
                color: Colors.deepOrange,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HazirTariflerEkrani(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              _buildButton(
                context,
                label: 'Benim Tariflerim',
                icon: Icons.kitchen,
                color: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BenimTariflerimEkrani(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required IconData icon, required Color color, required VoidCallback onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: color,
        shadowColor: Colors.black.withOpacity(0.2),
        elevation: 6,
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24.0, color: Colors.white),
          const SizedBox(width: 10.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
