import 'package:flutter/material.dart';
import 'package:newsound/Screens/About/about_us.dart';
import 'package:newsound/Screens/Explore/Explore.dart';
import 'package:newsound/Screens/Home/home.dart';
import 'package:newsound/Screens/Values/our_values.dart';
import 'package:newsound/Screens/Watch/watch.dart';
import 'package:provider/provider.dart';

class BottomNavBarState extends ChangeNotifier {
  int currentNavigationIndex = 0; //selected nav bar item index

  final navigationItemList = [
    //list of screens to navigate according to the nav bar item index
    const HomePage(),
    const About(),
    const Explore(),
    const Values(),
    const Watch(),
  ];

  void onBottomNavBarTap(int index) {
    currentNavigationIndex = index; //updates the selected nav bar index
    notifyListeners();
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BottomNavBarState(),
        child: const CreateBottomNavBar());
  }
}

class CreateBottomNavBar extends StatefulWidget {
  const CreateBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CreateBottomNavBar> createState() => _CreateBottomNavBarState();
}

class _CreateBottomNavBarState extends State<CreateBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var state = context.watch<BottomNavBarState>(); //creating state
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedIconTheme: const IconThemeData(
        size: 35.0,
        color: Colors.white,
        opacity: 100.0,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.white70,
        opacity: 80.0,
        size: 30.0,
      ),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedFontSize: 13.0,
      selectedFontSize: 17.0,
      currentIndex: state.currentNavigationIndex,
      onTap: (index) {
        state.onBottomNavBarTap(
            index); //call onBottomNavBartap method from BottomNavBarState class
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Colors.white),
          label: "Home",
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outlined, color: Colors.white),
          label: 'About',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_rounded, color: Colors.white),
          label: 'Explore',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("lib/Images/value_icon.png"), //By Freepik
              color: Colors.white),
          label: 'Values',
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon:
              ImageIcon(AssetImage("lib/Images/youtube_icon.png"), // By Freepik
                  color: Colors.white),
          label: 'Watch',
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}
