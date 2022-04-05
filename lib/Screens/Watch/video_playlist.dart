import 'package:flutter/material.dart';
import 'package:newsound/Models/channel_model.dart';
import 'package:newsound/Models/video_model.dart';
import 'package:newsound/Services/api_service.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC1W2KS3XUDyd-ukHX5-vpuQ');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 100.0,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
          blurRadius: 6.0,
        ),
      ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage("${_channel!.profilePictureUrl}"),
          ),
          SizedBox(width: 12.0),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _channel!.titlte!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${_channel!.subscriberCount} subscribers',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ))
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return ElevatedButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Image(
              width: 150.0,
              image: NetworkImage('${video.thumbnaillUrl}'),
            ),
            SizedBox(width: 10.0),
            Expanded(
                child: Text(
              video.title!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ))
          ],
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed("/giving");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlist"),
      ),
      body: _channel != null
          ? ListView.builder(
              itemCount: 1 + _channel!.videos!.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return _buildProfileInfo();
                }
                Video video = _channel!.videos![index - 1];
                return _buildVideo(video);
              },
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
    );
  }
}
