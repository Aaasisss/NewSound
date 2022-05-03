import 'package:flutter/material.dart';
import 'package:newsound/Models/event_model.dart';
import 'package:newsound/main.dart';

class EventPage extends StatefulWidget {
  final Event event;
  const EventPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event')),
      body: Container(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "lib/Images/default.jpg",
                ),
              ),
              border: Border.all(
                  color: Colors.red, width: 1.0, style: BorderStyle.solid),
            ),
          ),
          Center(
            child: Text(
              "${widget.event.title} ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
              child: ListView(
            children: [
              Text(
                'Venue Info:',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.event.venue}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Date:',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.event.date}",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Time:',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.event.time}, ${widget.event.timeZone} time",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Description:',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${widget.event.description}",
                style: TextStyle(fontSize: 20),
              ),
            ],
          )),
        ]),
      ),
    );
  }
}
