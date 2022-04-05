import 'package:flutter/material.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Watch extends StatefulWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  YoutubePlayerController _controller1 = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      isLive: true,
    ),
  );

  YoutubePlayerController _controller2 = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      isLive: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Watch"))),
      body: ListView(children: [
        //Padding(padding: EdgeInsets.all(15.0)),
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                "LIVE STREAMS",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            YoutubePlayer(
              controller: _controller1,
              aspectRatio: 16 / 9,
              showVideoProgressIndicator: true,
              controlsTimeOut: Duration(seconds: 3),
              progressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: () {
                _controller1.addListener(() {});
              },
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                "MID-WEEK MOMENTS",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            YoutubePlayer(
              controller: _controller2,
              aspectRatio: 16 / 9,
              showVideoProgressIndicator: true,
              controlsTimeOut: Duration(seconds: 3),
              progressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
              onReady: () {
                _controller1.addListener(() {});
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/playlist");
              },
              child: Text('See Playlist'),
            ),
            SizedBox(
              height: 20.0,
            ),
            CreateFolloIcons(),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ]),
    );
  }
}
