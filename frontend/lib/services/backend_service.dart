import 'dart:convert';
import 'package:http/http.dart' as http;
import 'env_loader.dart';

class BackendService {
  Future<String> sendMessage(String message) async {
    final baseUrl = EnvLoader.backendBaseUrl;
    final response = await http.post(
      Uri.parse('$baseUrl/api/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['response'];
    } else {
      throw Exception('Failed to get response from backend');
    }
  }
}
