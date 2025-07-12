class Result {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalName;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? name;
  bool? video;
  String? mediaType;

  Result({
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalName,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.name,
    this.video,
    this.mediaType,
  });

  String? get thumbnailPath => posterPath ?? backdropPath;

  String? get thumbnail => thumbnailPath != null
      ? 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$thumbnailPath'
      : null;

  String? get thumbnailSmall => thumbnailPath != null
      ? 'https://image.tmdb.org/t/p/w220_and_h330_face/$thumbnailPath'
      : null;

  String? get thumbnailUrl => thumbnailPath != null
      ? 'https://image.tmdb.org/t/p/original/$thumbnailPath'
      : null;

  String? get displayTitle => title ?? name ?? originalTitle;
}
