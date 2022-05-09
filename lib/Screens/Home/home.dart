import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsound/Models/event_model.dart';
import 'package:newsound/Screens/Home/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance.collection('events');

  Widget makeEventWidget(Event event) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: Colors.black, width: 2, style: BorderStyle.solid)),
        shadowColor: Colors.black,
        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
        color: Colors.blueAccent,
        elevation: 50.0,
        child: Container(
          //padding: EdgeInsets.all(10.0),
          //margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
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
            //borderRadius: BorderRadius.circular(10.0),
            // border: Border.all(
            //     color: Colors.black, width: 3.0, style: BorderStyle.solid),
          ),
          child: Hero(
            tag: event.photoUrl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "${event.title} this is a demo to worship the one and only god",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible),
                  ),
                ),
              ],
            ),
          ),
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
              reverse: true,
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
