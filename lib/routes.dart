import 'package:newsound/Screens/Explore/giving.dart';
import 'package:newsound/Screens/Watch/video_playlist.dart';
import 'Screens/About/about_us.dart';
import 'Screens/Explore/explore.dart';
import 'Screens/Home/home.dart';
import 'Screens/Values/our_values.dart';
import 'Screens/Watch/watch.dart';

var appRoute = {
  "/home": (context) => const HomePage(),
  "/about": (context) => const About(),
  "/explore": (context) => const Explore(),
  "/values": (context) => const Values(),
  "/watch": (context) => const Watch(),
  "/giving": (context) => const Giving(),
  "/playlist": (context) => const Playlist(),
};
