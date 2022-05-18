import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateFeedbackSection extends StatefulWidget {
  const CreateFeedbackSection({Key? key}) : super(key: key);

  @override
  State<CreateFeedbackSection> createState() => _CreateFeedbackSectionState();
}

class _CreateFeedbackSectionState extends State<CreateFeedbackSection> {
  final _firestore = FirebaseFirestore.instance.collection("feedback");
  final feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: const Text(
            "Feedback",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          width: 1000,
          child: Form(
            key: formKey,
            child: TextFormField(
              controller: feedbackController,
              validator: (value) {
                if (value!.length <= 20) {
                  return "Please write your feedback.";
                }
                return null;
              },
              minLines: 5,
              maxLines: null,
              decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "We appreciate your feedback"),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            if (isValid) {
              _firestore.add({
                'feedback': feedbackController.text,
                'serverTimeStamp': FieldValue.serverTimestamp()
              }).then((currentFeedbck) {
                //reset the field
                setState(() {
                  feedbackController.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Feedback sent."),
                  backgroundColor: Colors.greenAccent,
                ));
              });
            }
          },
          child: const Text("Send"),
        ),
        const SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
