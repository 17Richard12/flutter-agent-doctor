import 'dart:convert';
import 'package:http/http.dart' as http;
import 'env_loader.dart';

class YouTubeService {
  Future<List<dynamic>> fetchHealthVideos() async {
    final apiKey = EnvLoader.youtubeApiKey;
    final baseUrl = EnvLoader.youtubeBaseUrl;
    final response = await http.get(
      Uri.parse('$baseUrl/search?part=snippet&q=health&type=video&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
