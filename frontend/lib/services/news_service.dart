import 'dart:convert';
import 'package:http/http.dart' as http;
import 'env_loader.dart';

class NewsService {
  Future<List<dynamic>> fetchHealthNews() async {
    final apiKey = EnvLoader.newsApiKey;
    final baseUrl = EnvLoader.newsBaseUrl;
    final response = await http.get(
      Uri.parse('$baseUrl/everything?q=health&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
