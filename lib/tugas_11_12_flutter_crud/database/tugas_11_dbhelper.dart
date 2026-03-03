import 'package:belajar_flutter/tugas_11_12_flutter_crud/models/tugas_11_model.dart';
import 'package:belajar_flutter/day_16_17_18/database/sqflite.dart';

class Tugas11Dbhelper {
  static Future<void> registerSinau(Tugas11Model sinau) async {
    final dbs = await DBHelper.db();
    await dbs.insert('sinau', sinau.toMap());
    print(sinau.toMap);
  }

  static Future<List<Tugas11Model>> getAllsinau() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("sinau");
    print(results.map((e) => Tugas11Model.fromMap(e)).toList());
    return results.map((e) => Tugas11Model.fromMap(e)).toList();
  }

  static Future<int> updateSinau(Tugas11Model sinau) async {
    final dbs = await DBHelper.db();
    if (sinau.id == null) {
      throw Exception("ID Harus Ada");
    }
    return dbs.update(
      'sinau',
      sinau.toMap(),
      where: 'id = ?',
      whereArgs: [sinau.id],
    );
  }

  static Future<int> deleteSinau(int id) async {
    final dbs = await DBHelper.db();
    return dbs.delete('sinau', where: 'id = ?', whereArgs: [id]);
  }
}
