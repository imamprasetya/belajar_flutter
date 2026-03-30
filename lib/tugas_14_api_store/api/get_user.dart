import 'dart:convert';
import 'dart:developer';

import 'package:belajar_flutter/tugas_14_api_store/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<List<Welcome>> getUser() async {
  final response = await http.get(
    Uri.parse("https://fakestoreapi.com/products"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => Welcome.fromJson(json)).toList();
  } else {
    throw Exception("Gagal memuat data");
  }
}
