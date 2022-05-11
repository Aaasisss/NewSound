import 'package:flutter/material.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Giving extends StatefulWidget {
  const Giving({Key? key}) : super(key: key);

  @override
  State<Giving> createState() => _GivingState();
}

class _GivingState extends State<Giving> {
  final _firestore = FirebaseFirestore.instance.collection('bankAccountDetail');
  String accountName = '';
  String accountBsb = '';
  String accountNumber = '';

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  //loads the bank accound details
  void getInfo() async {
    final details = await _firestore.doc('accountDetails').get();
    setState(() {
      accountName = details.data()!['name'];
      accountBsb = details.data()!['bsb'];
      accountNumber = details.data()!['number'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25),
              child: Center(
                  child: Text('Giving',
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold))),
            ),
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
            const SizedBox(
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
                  children: [
                    const Padding(padding: EdgeInsets.all(20.0)),
                    Text(
                      accountBsb,
                      style: const TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      accountNumber,
                      style: const TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      accountName,
                      style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.visible),
                    ),
                    const Padding(padding: EdgeInsets.all(10.0)),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            const CreateFolloIcons(),
          ],
        ),
      ),
    );
  }
}
