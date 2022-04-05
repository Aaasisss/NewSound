import 'package:flutter/material.dart';
import 'package:newsound/Shared/bottom_nav.dart';
import 'package:newsound/routes.dart';
import 'package:newsound/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "New Sound Church",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: appRoute, //app routes defined in routes.dart
      home: ChangeNotifierProvider(
        create: (context) => BottomNavBarState(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var navBarState = Provider.of<BottomNavBarState>(
        context); //state from BottomNavBarStateClass

    return Scaffold(
      body: navBarState.navigationItemList[navBarState.currentNavigationIndex],
      bottomNavigationBar:
          const CreateBottomNavBar(), //creates a bottom nav bar from bottom_nav file
    );
  }
}
