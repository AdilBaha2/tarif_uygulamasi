import 'package:flutter/material.dart';
import 'ekranlar/ana_sayfa.dart';

void main() {
  runApp(const TarifUygulamasi());
}

class TarifUygulamasi extends StatelessWidget {
  const TarifUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarif Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.amber, // Ana renk
        scaffoldBackgroundColor: const Color(0xFFFFF9C4), // Pastel sarı arka plan
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFD54F), // Hardal sarısı AppBar rengi
          elevation: 4.0, // Gölge yüksekliği
          titleTextStyle: TextStyle(
            color: Colors.black, // Başlık rengi
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black, // İkonların rengi
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.brown, fontSize: 16.0), // Ana metin rengi
          bodyMedium: TextStyle(color: Colors.brown, fontSize: 14.0), // İkincil metin rengi
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFE8A1), // Krem sarısı buton
            foregroundColor: Colors.brown, // Kahverengi yazı rengi
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Yuvarlatılmış köşeler
            ),
          ),
        ),
      ),
      home: const AnaSayfa(),
    );
  }
}
