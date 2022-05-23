import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsound/Models/event_model.dart';
import 'package:newsound/Screens/Home/event.dart';
import 'package:newsound/Shared/theme_provider.dart';
import 'package:provider/provider.dart';

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
          side: const BorderSide(
            color: Color(0xFFFDB301),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        shadowColor: Colors.black,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.blueAccent,
        elevation: 50.0,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: event.photoUrl,
                child: Image(
                  image: NetworkImage(
                    "${event.photoUrl}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "${event.title}",
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _firestore.orderBy("serverTimeStamp", descending: true).get();
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
        stream:
            _firestore.orderBy("serverTimeStamp", descending: true).snapshots(),
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
            return const Text(
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
