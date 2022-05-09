import 'package:flutter/material.dart';
import 'package:newsound/Models/event_model.dart';

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
      appBar: AppBar(title: const Text('Event')),
      body: ListView(
        children: [
          Hero(
            tag: widget.event.photoUrl,
            child: Image(
              image: NetworkImage(widget.event.photoUrl),
            ),
          ),
          Center(
            child: Text(
              "${widget.event.title} ",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'Venue Info:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.event.venue}",
            style: const TextStyle(fontSize: 20),
          ),
          const Text(
            'Date:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.event.date}",
            style: const TextStyle(fontSize: 20),
          ),
          const Text(
            'Time:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.event.time}, ${widget.event.timeZone} time",
            style: const TextStyle(fontSize: 20),
          ),
          const Text(
            'Description:',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "${widget.event.description}",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
