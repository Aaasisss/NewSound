import 'video_model.dart';

class Channel {
  String? id;
  String? titlte;
  String? profilePictureUrl;
  String? subscriberCount;
  String? videoCount;
  String? uploadPlaylistId;
  List<Video>? videos;

  Channel({
    this.id,
    this.titlte,
    this.profilePictureUrl,
    this.subscriberCount,
    this.videoCount,
    this.uploadPlaylistId,
    this.videos,
  });

  factory Channel.fromMaP(Map<String, dynamic> map) {
    return Channel(
      id: map['id'],
      titlte: map['snippet']['title'],
      profilePictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscriberCount: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
      uploadPlaylistId: map['contentDetails']['relatedPlaylists']['uploads'],
    );
  }
}
