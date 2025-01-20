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
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFFFFF9C4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFD54F),
          elevation: 4.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.brown, fontSize: 16.0),
          bodyMedium: TextStyle(color: Colors.brown, fontSize: 14.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFE8A1),
            foregroundColor: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
      ),
      home: const AnaSayfa(),
    );
  }
}
