import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movieradar/data/models/media_model.dart';
import 'package:movieradar/data/services/tmdb_service.dart';

class DetailsPage extends StatefulWidget {
  final MediaModel movie;

  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late YoutubePlayerController _controller;
  final TmdbService _tmdbService = TmdbService();
  bool _isLoading = true;
  bool _hasTrailer = false;
  String? _trailerKey;

  @override
  void initState() {
    super.initState();
    _loadTrailer();
  }

  Future<void> _loadTrailer() async {
    try {
      final trailerUrl = await _tmdbService.fetchTrailerUrl(
        widget.movie.id,
        widget.movie.mediaType,
      );

      if (trailerUrl != null) {
        _trailerKey = YoutubePlayer.convertUrlToId(trailerUrl);

        if (_trailerKey != null) {
          _controller = YoutubePlayerController(
            initialVideoId: _trailerKey!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
              enableCaption: true,
              captionLanguage: 'es',
            ),
          );
          _hasTrailer = true;
        }
      }
    } catch (e) {
      print('Error loading trailer: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    if (_hasTrailer) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.displayTitle),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.movie.thumbnailUrl.isNotEmpty)
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.movie.thumbnailUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            // Información básica
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.displayTitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fecha de lanzamiento: ${widget.movie.releaseDate}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Sinopsis',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.movie.overview.isNotEmpty
                        ? widget.movie.overview
                        : 'Sin descripción disponible',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),

                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _hasTrailer
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Trailer',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.red,
                              onReady: () {
                                print('Player is ready.');
                              },
                              onEnded: (data) {},
                            ),
                          ],
                        )
                      : Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 54, 54, 54),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.info_outline),
                              SizedBox(width: 8),
                              Text('No hay trailer disponible'),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
