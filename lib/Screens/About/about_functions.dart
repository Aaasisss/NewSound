import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//a function that returns the text widget for quotes
Widget createTextBox(String quote) {
  return Container(
    margin: EdgeInsets.all(5.0),
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.orange, width: 3),
    ),
    child: Text(quote),
  );
}

//a function that creates paster info widget
Widget createPasterInfo() {
  return Container(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            //Pastor info
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Raed & Fadia Haddad",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '"Our desire is to see the kingdom of God demonstrated with power in our community. We like to be open to the gifts and fruits of the Holy Spirit. We are passionate to see a prophetic community that sees the world as God sees it."',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: Image(
            image: AssetImage("lib/Images/pastors.png"),
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

//a function that creates contact info under maps
Widget createContact() {
  var normalFontSize = 17.0;
  var headingFontSize = 30.0;
  return Container(
    padding: EdgeInsets.all(10.0),
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
            "26-28 Stanley Street, Bankstown NSW 2200",
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
                Icon(Icons.phone),
                Text(
                  "(02) 9790 1459",
                  style: TextStyle(
                    fontSize: normalFontSize,
                  ),
                ),
              ],
            ),
            onTap: () async {
              final phoneNumber = '(02) 9790 1459';
              final url = 'tel:$phoneNumber';
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
                Icon(Icons.email),
                Text(
                  "info@newsound.org.au",
                  style: TextStyle(
                    fontSize: normalFontSize,
                  ),
                )
              ],
            ),
            onTap: () async {
              final toEmail = "info@newsound.org.au";
              final subject = "New Enquiry";
              final message = "Hi there, \n\n\n\n Thank you,\n Regards,";
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
