import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsound/Screens/Explore/giving.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'package:newsound/Shared/style.dart';
import 'package:newsound/Shared/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

//List of the widgets on explore page
final List<Widget> exploreItemList = [
  const ExploreList_Modes(),
  const ExploreList_Blogs(),
  const ExploreList_Giving(),
  const ExploreList_ImNew(),
  const ExploreList_VisitWebsite(),
  const CreateFolloIcons(),
];

//"Dark and light mode" list item
class ExploreList_Modes extends StatefulWidget {
  const ExploreList_Modes({Key? key}) : super(key: key);

  @override
  State<ExploreList_Modes> createState() => _ExploreList_ModesState();
}

class _ExploreList_ModesState extends State<ExploreList_Modes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: fontColors['theme'],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: fontColors['theme'],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Dark Mode",
              style: TextStyle(fontSize: 30.0),
            ),
            createToggleButton(),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class createToggleButton extends StatelessWidget {
  const createToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        //final provider = Provider.of<ThemeProvider>(context, listen: false);
        themeProvider.toggleTheme(value);
      },
    );
  }
}

//"Articles" list item
class ExploreList_Blogs extends StatelessWidget {
  const ExploreList_Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: fontColors['theme'],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: fontColors['theme'],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Articles",
              style: TextStyle(fontSize: 30.0),
            ),
            Icon(
              Icons.book,
              size: 30.0,
            ),
          ],
        ),
        onPressed: () async {
          const url = "https://newsound.org.au/articles/";
          if (await canLaunch(url)) {
            await launch(url,
                forceSafariVC: true, //for iOS
                forceWebView: true, //for Android
                enableJavaScript: true);
          }
        },
      ),
    );
  }
}

//"Giving" list item
class ExploreList_Giving extends StatelessWidget {
  const ExploreList_Giving({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: fontColors['theme'],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: fontColors['theme'],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Giving",
              style: TextStyle(fontSize: 30.0),
            ),
            FaIcon(
              FontAwesomeIcons.handHoldingUsd,
              size: 30.0,
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Giving()));
        },
      ),
    );
  }
}

//"I'm New" list item
class ExploreList_ImNew extends StatelessWidget {
  const ExploreList_ImNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: fontColors['theme'],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: fontColors['theme'],
        ),
        onPressed: () async {
          const url =
              "https://docs.google.com/forms/d/e/1FAIpQLSfOag3ldLEAatitaX9FABnnpv7HO5_lNWSrmCXraPmZDusUMg/viewform";
          if (await canLaunch(url)) {
            await launch(url,
                forceSafariVC: true, //for iOS
                forceWebView: true, //for Android
                enableJavaScript: true);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "I'm New",
              style: TextStyle(fontSize: 30.0),
            ),
            Icon(
              Icons.open_in_browser,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

//'visit website' list item
class ExploreList_VisitWebsite extends StatelessWidget {
  const ExploreList_VisitWebsite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: fontColors['theme'],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: fontColors['theme'],
        ),
        onPressed: () async {
          const url = "https://newsound.org.au/";
          if (await canLaunch(url)) {
            await launch(url,
                forceSafariVC: true, //for iOS
                forceWebView: true, //for Android
                enableJavaScript: true);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Visit Website",
              style: TextStyle(fontSize: 30.0),
            ),
            Icon(
              Icons.open_in_browser,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
