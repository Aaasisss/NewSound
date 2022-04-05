import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CreateFolloIcons extends StatefulWidget {
  const CreateFolloIcons({Key? key}) : super(key: key);

  @override
  State<CreateFolloIcons> createState() => _CreateFolloIconsState();
}

class _CreateFolloIconsState extends State<CreateFolloIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Follow Us",
              style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <IconButton>[
                  IconButton(
                      onPressed: () async {
                        const url =
                            "https://instagram.com/newsoundchurchsydney";
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.instagramSquare,
                        color: Colors.black,
                        size: 50.0,
                      )),
                  IconButton(
                      onPressed: () async {
                        final url = "https://youtube.com/NewSoundChurchSydney";
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.youtubeSquare,
                        color: Colors.black,
                        size: 50.0,
                      )),
                  IconButton(
                      onPressed: () async {
                        const url =
                            "https://www.facebook.com/newsoundchurchsydney";
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.facebookSquare,
                        color: Colors.black,
                        size: 50.0,
                      )),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
