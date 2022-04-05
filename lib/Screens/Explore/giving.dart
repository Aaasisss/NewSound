import 'package:flutter/material.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'package:newsound/main.dart';

class Giving extends StatefulWidget {
  const Giving({Key? key}) : super(key: key);

  @override
  State<Giving> createState() => _GivingState();
}

class _GivingState extends State<Giving> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giving")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text(
                    "Whoever sows sparingly will also reap sparingly , and whoever sows generously will also reap generously. Each of you should give what you have decided in your heart to give, not reluctantly or under compulsion, for God loves a cheerful giver.",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text(
                    "2 Corinthians 9:6-7",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange, width: 3),
              ),
              child: SizedBox(
                height: 250.0,
                width: 300,
                child: Column(
                  children: const [
                    Padding(padding: EdgeInsets.all(20.0)),
                    Text(
                      "704-922",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      "100003078",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      "NEW SOUND",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      "CHURCH",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            CreateFolloIcons(),
          ],
        ),
      ),
    );
  }
}
