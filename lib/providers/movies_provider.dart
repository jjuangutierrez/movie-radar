import 'package:flutter/material.dart';
import 'package:movieradar/data/models/media_model.dart';

class MovieProvider extends ChangeNotifier {
  final List<MediaModel> _myMovies = [];

  List<MediaModel> get myMovies => List.unmodifiable(_myMovies);

  void addMovie(MediaModel movie) {
    // Evitar duplicados
    if (!_myMovies.any((m) => m.id == movie.id)) {
      _myMovies.add(movie);
      notifyListeners();
    }
  }

  void removeMovie(MediaModel movie) {
    _myMovies.removeWhere((m) => m.id == movie.id);
    notifyListeners();
  }
}
