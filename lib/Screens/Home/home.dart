import 'package:flutter/material.dart';
import 'package:newsound/Screens/Explore/giving.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsound/Models/event_model.dart';
import 'package:newsound/Screens/Home/event.dart';
import 'package:newsound/utilities/Keys.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance.collection('events');

  Widget makeEventWidget(Event event) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "${event.photoUrl}",
            ),
            //AssetImage('lib/Images/default.jpg'),
          ),
          border: Border.all(
              color: Colors.red, width: 1.0, style: BorderStyle.solid),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.black26),
              child: Column(
                children: [
                  Text(
                    "${event.title} this is a demo to worship the one and only god",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        overflow: TextOverflow.ellipsis),
                  ),
                  // Text("${event.description}"),
                  // Text("${event.venue}"),
                  // Text("${event.date}"),
                  // Text("${event.time}"),
                  // Text("${event.timeZone}"),
                  //Text("${event.photoUrl}"),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => EventPage(event: event))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("WHAT'S NEW?")),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _firestore.snapshots(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            final events = asyncSnapshot.data!.docs;

            List<Widget> eventWidgetsList = [];
            for (var event in events) {
              var data = event.data();
              var eventInstance = Event.fromJson(data);
              eventWidgetsList.add(makeEventWidget(eventInstance));
            }

            return ListView(
              children: eventWidgetsList,
            );
          } else if (asyncSnapshot.hasError) {
            return Text(
              'Error!',
              style: TextStyle(color: Colors.red),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
