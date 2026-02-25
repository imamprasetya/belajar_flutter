import 'dart:convert';

class Pengajar {
  final String nama;
  final String mapel;
  final String gambar;

  Pengajar({
    required this.nama,
    required this.mapel,
    required this.gambar,
  });

  factory Pengajar.fromJson(Map<String, dynamic> json) {
    return Pengajar(
      nama: json['nama'],
      mapel: json['mapel'],
      gambar: json['gambar'],
    );
  }

  static List<Pengajar> fromJsonList(String str) {
    final List data = json.decode(str);
    return data.map((e) => Pengajar.fromJson(e)).toList();
  }
}