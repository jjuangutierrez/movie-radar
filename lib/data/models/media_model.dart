class MediaModel {
  final int id;
  final String displayTitle;
  final String mediaType;
  final String overview;
  final String releaseDate;
  final String thumbnail;
  final String thumbnailSmall;
  final String thumbnailUrl;

  MediaModel({
    required this.id,
    required this.displayTitle,
    required this.mediaType,
    required this.overview,
    required this.releaseDate,
    required this.thumbnail,
    required this.thumbnailSmall,
    required this.thumbnailUrl,
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
      releaseDate: json['release_date'] ?? '',
      thumbnail:
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$thumbnailPath',
      thumbnailSmall:
          'https://image.tmdb.org/t/p/w220_and_h330_face/$thumbnailPath',
      thumbnailUrl: 'https://image.tmdb.org/t/p/original/$thumbnailPath',
    );
  }
}
