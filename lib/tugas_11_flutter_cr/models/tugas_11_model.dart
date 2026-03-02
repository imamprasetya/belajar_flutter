// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tugas11Model {
  final int? id;
  final String pelajaran;
  final String materi;
  final String guru;
  final String kelas;
  Tugas11Model({
    this.id,
    required this.pelajaran,
    required this.materi,
    required this.guru,
    required this.kelas,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pelajaran': pelajaran,
      'materi': materi,
      'guru': guru,
      'kelas': kelas,
    };
  }

  factory Tugas11Model.fromMap(Map<String, dynamic> map) {
    return Tugas11Model(
      id: map['id'] != null ? map['id'] as int : null,
      pelajaran: map['pelajaran'] as String,
      materi: map['materi'] as String,
      guru: map['guru'] as String,
      kelas: map['kelas'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tugas11Model.fromJson(String source) =>
      Tugas11Model.fromMap(json.decode(source) as Map<String, dynamic>);
}
