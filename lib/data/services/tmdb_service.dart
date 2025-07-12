import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/media_model.dart';
import '../../core/tmdb_config.dart';

class TmdbService {
  Future<List<MediaModel>> fetchMediaList(String endpoint) async {
    final url = '${TmdbConfig.baseUrl}$endpoint&api_key=${TmdbConfig.apiKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final results = jsonBody['results'] as List;

      return results.map((json) => MediaModel.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching media list');
    }
  }
}
