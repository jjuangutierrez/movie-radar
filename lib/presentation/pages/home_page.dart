import 'package:flutter/material.dart';
import 'package:movieradar/core/tmdb_urls.dart';
import 'package:movieradar/presentation/widgets/movie_row.dart';
import 'package:movieradar/presentation/widgets/random_movie_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Radar')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: RandomMovieHeader(moviesUrl: TmdbUrls.trending),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: MovieRow(
                moviesUrl: TmdbUrls.topRated,
                heading: 'Top rated',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: MovieRow(
                moviesUrl: TmdbUrls.trending,
                heading: 'Trending',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: MovieRow(
                moviesUrl: TmdbUrls.netflixOriginals,
                heading: 'Netflix originals',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
