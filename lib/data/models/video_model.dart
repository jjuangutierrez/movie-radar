class VideoModel {
  String name;
  String key;
  String site;
  String type;
  bool official;
  DateTime publishedAt;

  VideoModel({
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  String get thumbnail => 'https://i.ytimg.com/vi/$key/mqdefault.jpg';
}
