import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Veritabani {
  static final Veritabani _instance = Veritabani._internal();
  Database? _database;

  factory Veritabani() {
    return _instance;
  }

  Veritabani._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'tarif_uygulamasi.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tarifler (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        kategori TEXT NOT NULL,
        ad TEXT NOT NULL,
        malzemeler TEXT NOT NULL,
        hazirlanis TEXT NOT NULL,
        oneriler TEXT
      );
    ''');
    print('Veritabanı oluşturuldu.');
  }

  // Tarif ekleme
  Future<int> tarifEkle(String kategori, String ad, String malzemeler, String hazirlanis, String oneriler) async {
    try {
      final db = await database;
      return await db.insert('tarifler', {
        'kategori': kategori,
        'ad': ad,
        'malzemeler': malzemeler,
        'hazirlanis': hazirlanis,
        'oneriler': oneriler,
      });
    } catch (e) {
      print('Tarif ekleme sırasında hata: $e');
      return -1; // Hata durumunda -1 döner
    }
  }

  // Tarifleri kategoriye göre getir
  Future<List<Map<String, dynamic>>> tarifleriGetir(String kategori) async {
    if (kategori.isEmpty) {
      throw ArgumentError('Kategori boş olamaz.');
    }
    final db = await database;
    final result = await db.query(
      'tarifler',
      where: 'kategori = ?',
      whereArgs: [kategori],
    );
    print('Kategoriye göre getirilen tarifler: $result');
    return result;
  }

  // Tarif güncelleme
  Future<int> tarifGuncelle(
      int id, String yeniAd, String yeniMalzemeler, String yeniHazirlanis, String yeniOneriler) async {
    try {
      final db = await database;
      return await db.update(
        'tarifler',
        {
          'ad': yeniAd,
          'malzemeler': yeniMalzemeler,
          'hazirlanis': yeniHazirlanis,
          'oneriler': yeniOneriler,
        },
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Tarif güncelleme sırasında hata: $e');
      return -1; // Hata durumunda -1 döner
    }
  }

  // Tarif silme
  Future<int> tarifSil(int id) async {
    try {
      final db = await database;
      return await db.delete(
        'tarifler',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Tarif silme sırasında hata: $e');
      return -1; // Hata durumunda -1 döner
    }
  }
}

