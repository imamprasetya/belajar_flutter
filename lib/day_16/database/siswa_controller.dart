import 'package:belajar_flutter/day_16/database/sqflite.dart';
import 'package:belajar_flutter/day_16/models/siswa_model.dart';

class SiswaController {
  static Future<void> registerSiswa(SiswaModel siswa) async {
    final dbs = await DBHelper.db();
    await dbs.insert('siswa', siswa.toMap());
    print(siswa.toMap);
  }

  static Future<List<SiswaModel>> getAllSiswa() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("Siswa");
    print(results.map((e) => SiswaModel.fromMap(e)).toList());
    return results.map((e) => SiswaModel.fromMap(e)).toList();
  }
}

/*Flow Kerja
1. Buat DBHelper (Database, Table)
2. Membuat Model
*/
