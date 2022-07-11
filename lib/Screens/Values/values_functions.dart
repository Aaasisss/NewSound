import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:newsound/Services/api_service.dart';

class CreateFeedbackSection extends StatefulWidget {
  const CreateFeedbackSection({Key? key}) : super(key: key);

  @override
  State<CreateFeedbackSection> createState() => _CreateFeedbackSectionState();
}

class _CreateFeedbackSectionState extends State<CreateFeedbackSection> {
  final _firestore = FirebaseFirestore.instance.collection("feedback");
  final feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //loads env files for authentication
  // Future<void> loadEnvFile() async {
  //   await dotenv.load();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

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
          onPressed: () async {
            final isValid = formKey.currentState!.validate();
            if (isValid) {
              
              AuthService().signInWithEmail(
                  FlutterConfig.get('EMAIL'), FlutterConfig.get('PASSWORD'));
              try {
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
              } on FirebaseException catch (e) {
                print(e);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Feedback cannot be sent.."),
                  backgroundColor: Colors.redAccent,
                ));
              }
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
