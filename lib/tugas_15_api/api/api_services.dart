import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://absensib1.mobileprojp.com/api";

  // REGISTER
  static Future register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      body: {"name": name, "email": email, "password": password},
    );

    return jsonDecode(response.body);
  }

  // LOGIN
  static Future login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: {"email": email, "password": password},
    );

    return jsonDecode(response.body);
  }

  // GET PROFILE
  static Future getProfile(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/profile"),
      headers: {"Authorization": "Bearer $token"},
    );
    log(response.body);
    return jsonDecode(response.body);
  }

  // UPDATE PROFILE
  static Future updateProfile(String token, String name, String email) async {
    final response = await http.put(
      Uri.parse("$baseUrl/profile"),
      headers: {"Authorization": "Bearer $token"},
      body: {"name": name, "email": email},
    );

    return jsonDecode(response.body);
  }
}
