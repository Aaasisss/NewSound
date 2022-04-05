import 'package:flutter/material.dart';

void sendFeedback() {
  print("feedback pressed");
}

// ignore: non_constant_identifier_names
Widget CreateFeedbackBox() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        child: const Text(
          "Feedback",
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        width: 1000,
        child: const TextField(
          minLines: 5,
          maxLines: null,
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Write your feedback"),
        ),
      ),
      const ElevatedButton(
        onPressed: sendFeedback,
        child: Text("Send"),
      ),
      const SizedBox(
        height: 20.0,
      )
    ],
  );
}
