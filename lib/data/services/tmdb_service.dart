import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieradar/core/tmdb_config.dart';
import '../models/media_model.dart';

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

  Future<String?> fetchTrailerUrl(int id, String mediaType) async {
    final url =
        '${TmdbConfig.baseUrl}/$mediaType/$id/videos?api_key=${TmdbConfig.apiKey}&language=en-US';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);

        final results = jsonBody['results'] as List;

        if (results.isNotEmpty) {
          // Mostrar todos los videos disponibles para debug
          for (int i = 0; i < results.length; i++) {
            final video = results[i];
          }

          // Buscar trailer de YouTube
          final trailer = results.firstWhere(
            (video) => video['type'] == 'Trailer' && video['site'] == 'YouTube',
            orElse: () => null,
          );

          if (trailer != null) {
            final trailerUrl =
                'https://www.youtube.com/watch?v=${trailer['key']}';
            return trailerUrl;
          } else {
            // Si no hay trailer, buscar cualquier video de YouTube
            final anyYouTubeVideo = results.firstWhere(
              (video) => video['site'] == 'YouTube',
              orElse: () => null,
            );

            if (anyYouTubeVideo != null) {
              final videoUrl =
                  'https://www.youtube.com/watch?v=${anyYouTubeVideo['key']}';
              return videoUrl;
            }
          }
        }

        print('No YouTube videos found');
        return null;
      } else {
        throw Exception('HTTP ${response.statusCode}: Error fetching trailer');
      }
    } catch (e) {
      rethrow;
    }
  }
}
