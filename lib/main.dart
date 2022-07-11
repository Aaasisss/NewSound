import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsound/Shared/bottom_nav.dart';
import 'package:newsound/Shared/routes.dart';
import 'package:newsound/Shared/style.dart';
import 'package:newsound/Shared/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvidor = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "New Sound Church",
          themeMode: themeProvidor.themeMode,
          theme: ThemeModes.lightTheme,
          darkTheme: ThemeModes.darkTheme,
          routes: appRoute, //app routes defined in routes.dart
          home: const WelcomeScreen(),
        );
      });
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    TextStyle colorizeTextStyle = GoogleFonts.trispace(
      textStyle: Theme.of(context).textTheme.headline4,
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.amberAccent,
      shadows: [
        const Shadow(
          offset: Offset(3.0, 3.0),
          blurRadius: 3.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ],
    );

    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: InkWell(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage('lib/Images/logo.png'),
                          height: 150.0,
                          width: 150.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "Life",
                                textStyle: GoogleFonts.dancingScript(
                                  textStyle:
                                      Theme.of(context).textTheme.headline4,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color = Colors.blue,
                                ),
                                speed: const Duration(milliseconds: 500),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'More',
                            style: GoogleFonts.robotoMono(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: fontColors['theme'],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AnimatedTextKit(
                            totalRepeatCount: 5,
                            animatedTexts: [
                              ColorizeAnimatedText(
                                "Abundantly",
                                textStyle: colorizeTextStyle,
                                speed: const Duration(milliseconds: 500),
                                colors: colorizeColors,
                              ),
                            ],
                            isRepeatingAnimation: true,
                          ),
                        ),
                        const Text(
                          '"I have comethat they may have life,',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const Text(
                          'and that they may have it',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const Text(
                          'more abundantly."',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        const Text(
                          "- Jesus",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const App()),
          );
        },
      ),
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
