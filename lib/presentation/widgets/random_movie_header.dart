import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movieradar/data/models/media_model.dart';
import 'package:movieradar/data/services/tmdb_service.dart';
import 'package:movieradar/presentation/pages/details_page.dart';
import 'package:movieradar/presentation/widgets/info_card.dart';

class RandomMovieHeader extends StatefulWidget {
  final String moviesUrl;

  const RandomMovieHeader({Key? key, required this.moviesUrl})
    : super(key: key);

  @override
  State<RandomMovieHeader> createState() => _RandomMovieHeaderState();
}

class _RandomMovieHeaderState extends State<RandomMovieHeader> {
  late Future<List<MediaModel>> _futureMovies;
  final TmdbService _service = TmdbService();

  @override
  void initState() {
    super.initState();
    _futureMovies = _service.fetchMediaList(widget.moviesUrl);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MediaModel>>(
      future: _futureMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SizedBox(
            height: 300,
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox(
            height: 300,
            child: Center(child: Text('No movies found')),
          );
        }

        final movies = snapshot.data!;
        final randomIndex = Random().nextInt(movies.length);
        final selectedMovie = movies[randomIndex];

        return Container(
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                // Imagen de fondo
                Positioned.fill(
                  child: Image.network(
                    selectedMovie.thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: const Center(
                          child: Icon(
                            Icons.movie,
                            size: 48,
                            color: Colors.white54,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Gradiente overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectedMovie.displayTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(movie: selectedMovie),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.play_arrow),
                              label: const Text('Play'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      InfoCard(movie: selectedMovie),
                                );
                              },
                              icon: const Icon(Icons.info_outline),
                              label: const Text('Info'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              label: const Text('Add List'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
