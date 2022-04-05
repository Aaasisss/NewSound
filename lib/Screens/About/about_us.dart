import 'package:flutter/material.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'about_functions.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("About Us"))),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 3),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    createTextBox(
                        "A loving and joyful multicultural church community in the heart of Bankstown, Sydney."),
                    createTextBox(
                        "Kingdom people who are led by God's Word and the Holy Spirit."),
                    createTextBox(
                        "Children of God and believers in His goodness to us all the time."),
                    createTextBox(
                        "Passionate about bringing the message of reconciliation, freedom, healing and deliverance to all people."),
                    createTextBox(
                        "We would love to see you online or in person at our 10:00am service on Sunday mornings."),
                  ],
                ),
              ),
              Container(
                child: const Text(
                  "PASTORS",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              createPasterInfo(),
              createMap(),
              createContact(),
              CreateFolloIcons(),
              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
