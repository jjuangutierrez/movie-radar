import 'package:movieradar/data/models/genre_model.dart';

class GenreWrapperModel {
  final List<GenreModel> genres;

  GenreWrapperModel({required this.genres});

  factory GenreWrapperModel.fromJson(Map<String, dynamic> json) {
    return GenreWrapperModel(
      genres: (json['genres'] as List)
          .map((g) => GenreModel.fromJson(g))
          .toList(),
    );
  }
}
