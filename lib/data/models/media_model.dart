class MediaModel {
  final int id;
  final String displayTitle;
  final String mediaType;
  final String overview;
  final String releaseDate;
  final String thumbnail;
  final String thumbnailSmall;
  final String thumbnailUrl;
  final String trailerUrl;

  MediaModel({
    required this.id,
    required this.displayTitle,
    required this.mediaType,
    required this.overview,
    required this.releaseDate,
    required this.thumbnail,
    required this.thumbnailSmall,
    required this.thumbnailUrl,
    required this.trailerUrl,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    final title =
        json['title'] ??
        json['name'] ??
        json['original_title'] ??
        json['original_name'];
    final posterPath = json['poster_path'];
    final backdropPath = json['backdrop_path'];
    final thumbnailPath = posterPath ?? backdropPath ?? '';

    return MediaModel(
      id: json['id'],
      displayTitle: title,
      mediaType: json['media_type'] ?? 'movie',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? json['first_air_date'] ?? '',
      thumbnail: thumbnailPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$thumbnailPath'
          : '',
      thumbnailSmall: thumbnailPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/w220_and_h330_face/$thumbnailPath'
          : '',
      thumbnailUrl: thumbnailPath.isNotEmpty
          ? 'https://image.tmdb.org/t/p/original/$thumbnailPath'
          : '',
      trailerUrl: '', // Se llenará dinámicamente
    );
  }

  // Método para crear una copia con trailer URL
  MediaModel copyWith({
    int? id,
    String? displayTitle,
    String? mediaType,
    String? overview,
    String? releaseDate,
    String? thumbnail,
    String? thumbnailSmall,
    String? thumbnailUrl,
    String? trailerUrl,
  }) {
    return MediaModel(
      id: id ?? this.id,
      displayTitle: displayTitle ?? this.displayTitle,
      mediaType: mediaType ?? this.mediaType,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      thumbnail: thumbnail ?? this.thumbnail,
      thumbnailSmall: thumbnailSmall ?? this.thumbnailSmall,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      trailerUrl: trailerUrl ?? this.trailerUrl,
    );
  }
}
