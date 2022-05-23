// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Watch extends StatefulWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    launch("https://www.youtube.com/c/NewSoundChurchSydney/playlists");
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height / 8;
    final cardHeight = containerHeight / 1.5;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('WATCH')),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: containerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: containerHeight,
                    width: containerHeight,
                    margin: const EdgeInsets.all(10),
                    child: const CircleAvatar(
                      child: Image(
                        image: AssetImage("lib/Images/logo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: const Text(
                        "NEW SOUND CHRURCH",
                        style: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            createCard(
                'Our Values',
                "https://www.youtube.com/watch?v=Gl-SNmQFTuI&list=PL3kmjHeHhU4aH_25ZV2qp2Et7i_JzRaCR",
                cardHeight),
            createCard(
                "Sermons",
                "https://www.youtube.com/watch?v=-aLKbpBBpK8&list=PL3kmjHeHhU4bEX6DoxjWKTDLxNH_Y-Fp2",
                cardHeight),
            createCard(
                "Worship Songs",
                "https://www.youtube.com/watch?v=vqwPFj_U92U&list=PL3kmjHeHhU4b5ctEGY7jckSIJBQJwuSAJ",
                cardHeight),
            createCard(
                "Mid-week Moments",
                "https://www.youtube.com/watch?v=DlmjcOjOgmA&list=PL3kmjHeHhU4ZNZIkqGvJEL6C1e9ob7p1j",
                cardHeight),
            createCard(
                "Services",
                "https://www.youtube.com/watch?v=DQFW3XKt5c0&list=PL3kmjHeHhU4bOFfxhfKRLc0L7xpMZyt_y",
                cardHeight),
          ],
        ),
      ),
    );
  }
}

Widget createCard(String title, String url, double height) {
  return InkWell(
    child: Card(
      //elevation: 50,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
            gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 155, 190, 250),
          const Color.fromARGB(255, 247, 223, 136),
          Color.fromARGB(255, 249, 103, 103),
          const Color.fromARGB(255, 147, 250, 200),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        //margin: EdgeInsets.all(50),
        child: Center(
          child: Text(
            "${title}",
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    ),
    onTap: () async {
      if (await canLaunch(url)) {
        launch(url);
      }
    },
  );
}
