import 'package:movieradar/data/models/video_model.dart';

class VideosWrapperModel {
  int? id;
  List<VideoModel>? results;

  VideosWrapperModel({this.id, this.results});

  static bool filterTrailerTeasers(VideoModel v) {
    return v.official == true &&
        v.site.toLowerCase() == 'youtube' &&
        (v.type.toLowerCase() == 'teaser' || v.type.toLowerCase() == 'trailer');
  }
}
