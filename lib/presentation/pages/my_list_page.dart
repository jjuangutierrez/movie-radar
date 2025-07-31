import 'package:flutter/material.dart';
import 'package:movieradar/presentation/pages/details_page.dart';
import 'package:movieradar/presentation/widgets/info_card.dart';
import 'package:movieradar/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your saved movies!")),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.myMovies.isEmpty) {
            return const Center(
              child: Text(
                'No movies added yet!\nStart browsing and add some movies.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            );
          }

          return ListView.builder(
            itemCount: movieProvider.myMovies.length,
            itemBuilder: (context, index) {
              final movie = movieProvider.myMovies[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    movie.thumbnailSmall,
                    width: 50,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  movie.displayTitle,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  movie.overview != null
                      ? movie.overview!.length > 50
                            ? '${movie.overview!.substring(0, 50)}...'
                            : movie.overview!
                      : 'No description',
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    movieProvider.removeMovie(movie);
                  },
                ),
                onTap: () {
                  //
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(movie: movie),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
