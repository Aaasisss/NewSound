import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsound/Shared/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateFolloIcons extends StatefulWidget {
  const CreateFolloIcons({Key? key}) : super(key: key);

  @override
  State<CreateFolloIcons> createState() => _CreateFolloIconsState();
}

class _CreateFolloIconsState extends State<CreateFolloIcons> {
  final _firestore = FirebaseFirestore.instance.collection('socialLinks');
  String facebookLink = 'https://www.facebook.com/newsoundchurchsydney';
  String instagramLink = 'https://instagram.com/newsoundchurchsydney';
  String youtubeLink = 'https://youtube.com/NewSoundChurchSydney';

  //gets the latest data from the database
  void getInfo() async {
    final details = await _firestore.doc('socialLinks').get();
    //updates the default values
    setState(() {
      facebookLink = details.data()!['facebook'];
      instagramLink = details.data()!['instagram'];
      youtubeLink = details.data()!['youtube'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
        child: Column(
      children: <Widget>[
        Container(
          child: Text(
            "Follow Us",
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <IconButton>[
            IconButton(
              onPressed: () async {
                if (await canLaunch(instagramLink)) {
                  await launch(instagramLink);
                }
              },
              icon: const FaIcon(
                FontAwesomeIcons.instagramSquare,
                //color: Colors.black,
                size: 50.0,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (await canLaunch(youtubeLink)) {
                  await launch(youtubeLink);
                }
              },
              icon: const FaIcon(
                FontAwesomeIcons.youtube,
                //color: Colors.black,
                size: 50.0,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (await canLaunch(facebookLink)) {
                  await launch(facebookLink);
                }
              },
              icon: const FaIcon(
                FontAwesomeIcons.facebook,
                //color: Colors.black,
                size: 50.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
      ],
    ));
  }
}
