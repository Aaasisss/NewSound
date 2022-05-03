import 'package:flutter/material.dart';
import 'package:newsound/Shared/bottom_nav.dart';
import 'package:newsound/routes.dart';
import 'package:newsound/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:firebase_core/firebase_core.dart';

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
      theme: ThemeData(primaryColor: Colors.blue),
      routes: appRoute, //app routes defined in routes.dart
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text(
                'error!',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider(
              create: (context) => BottomNavBarState(), child: const Home());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Scaffold(
          body: Center(
            child: Text(
              'loading...',
              style: TextStyle(color: Colors.green),
            ),
          ),
        );
      },
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
