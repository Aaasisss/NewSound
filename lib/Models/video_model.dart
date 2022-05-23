//used later for youtube purposes

class Video {
  String? id;
  String? title;
  String? thumbnaillUrl;
  String? channelTitle;

  Video({this.id, this.title, this.thumbnaillUrl, this.channelTitle});

  factory Video.fromMap(Map<String, dynamic> snippet) {
    return Video(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnaillUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}
