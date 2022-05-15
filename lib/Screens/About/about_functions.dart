import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//a function that returns the text widget for quotes
Widget createTextBox(String quote) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.orange, width: 1),
    ),
    child: Text(quote),
  );
}

Widget createBelieveText() {
  return Container(
    height: 50.0,
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'WE BELIEVE IN ',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          DefaultTextStyle(
            style: const TextStyle(
                fontSize: 30.0,
                color: Color(0xFFFDB301),
                fontWeight: FontWeight.bold),
            child: AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              animatedTexts: [
                RotateAnimatedText('HEALING'),
                RotateAnimatedText('FREEDOM'),
                RotateAnimatedText('DELIVERANCE'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget pastorsRight(
    String name, String position, String description, String image) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  position,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Image(
            image: AssetImage("lib/Images/$image.png"),
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

Widget pastorsLeft(
    String name, String position, String description, String image) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage("lib/Images/$image.png"),
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  position,
                  style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//a function that creates contact info under maps
Widget createContact(String address, String phone, String email) {
  var normalFontSize = 17.0;
  var headingFontSize = 30.0;
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Address",
            style: TextStyle(
                fontSize: headingFontSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            address,
            style: TextStyle(
              fontSize: normalFontSize,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Pone",
            style: TextStyle(
                fontSize: headingFontSize, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.phone),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: normalFontSize,
                  ),
                ),
              ],
            ),
            onTap: () async {
              final url = 'tel:$phone';
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Email",
            style: TextStyle(
                fontSize: headingFontSize, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.email),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: normalFontSize,
                  ),
                )
              ],
            ),
            onTap: () async {
              final toEmail = email;
              const subject = "New Enquiry";
              const message = "Hi there, \n\n\n\n Thank you,\n Regards,";
              final url = 'mailto:$toEmail?subject=${subject}&body=${message}';
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
        ]),
  );
}

Widget createMap() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "GET IN TOUCH",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          child: const Image(
            image: AssetImage("lib/Images/map.png"),
            height: 200,
          ),
          onTap: () async {
            const url = "https://goo.gl/maps/HFhQfjJbWgh1hRMs7";
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
        )
      ],
    ),
  );
}
