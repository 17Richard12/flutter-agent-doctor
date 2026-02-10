import 'dart:convert';
import 'package:flutter/services.dart';

class EnvLoader {
  static Map<String, dynamic>? _youtubeConfig;
  static Map<String, dynamic>? _newsConfig;
  static Map<String, dynamic>? _mapsConfig;
  static Map<String, dynamic>? _backendConfig;

  static Future<void> load() async {
    _youtubeConfig = jsonDecode(await rootBundle.loadString('env/youtube_api.json'));
    _newsConfig = jsonDecode(await rootBundle.loadString('env/news_api.json'));
    _mapsConfig = jsonDecode(await rootBundle.loadString('env/Maps_api.json'));
    _backendConfig = jsonDecode(await rootBundle.loadString('env/backend_api.json'));
  }

  static String get youtubeApiKey => _youtubeConfig?['apiKey'] ?? '';
  static String get youtubeBaseUrl => _youtubeConfig?['baseUrl'] ?? '';

  static String get newsApiKey => _newsConfig?['apiKey'] ?? '';
  static String get newsBaseUrl => _newsConfig?['baseUrl'] ?? '';

  static String get mapsApiKey => _mapsConfig?['apiKey'] ?? '';

  static String get backendBaseUrl => _backendConfig?['baseUrl'] ?? '';
}
