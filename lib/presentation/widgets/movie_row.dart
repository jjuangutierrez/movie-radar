import 'package:flutter/material.dart';
import 'package:movieradar/data/models/media_model.dart';
import 'package:movieradar/data/services/tmdb_service.dart';
import 'movie_card.dart';

class MovieRow extends StatefulWidget {
  final String heading;
  final String moviesUrl;

  const MovieRow({Key? key, required this.heading, required this.moviesUrl})
    : super(key: key);

  @override
  State<MovieRow> createState() => _MovieRowState();
}

class _MovieRowState extends State<MovieRow> {
  late Future<List<MediaModel>> _futureMovies;
  final TmdbService _service = TmdbService();

  @override
  void initState() {
    super.initState();
    _futureMovies = _service.fetchMediaList(widget.moviesUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            widget.heading,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 210,
          child: FutureBuilder<List<MediaModel>>(
            future: _futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: \${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No movies found'));
              }

              final movies = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: MovieCard(movie: movie),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
