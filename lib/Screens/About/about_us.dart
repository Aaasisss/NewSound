import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'about_functions.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final _firestore = FirebaseFirestore.instance.collection('churchInformation');
  String address = '26-28 Stanley Street, Bankstown NSW 2200';
  String phone = '(02) 9790 1459';
  String email = 'info@newsound.org.au';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  void getInfo() async {
    final details = await _firestore.doc('churchInfo').get();
    setState(() {
      address = details.data()!['address'];
      phone = details.data()!['phone'];
      email = details.data()!['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("About Us",
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'WE BELIEVE IN ',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFFFDB301),
                            fontWeight: FontWeight.bold),
                        child: AnimatedTextKit(
                            repeatForever: true,
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              RotateAnimatedText('HEALING'),
                              RotateAnimatedText('FREEDOM'),
                              RotateAnimatedText('DELIVERANCE'),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              pastorsLeft(
                  'Raed Haddad',
                  'SENIOR PASTOR',
                  'Raed was born in Jordan and immigrated to America in his late teens. He began studying theology in the United States until he met Fadia and moved to Australia to get married. He finished his Bachelor of Theology from Morling College and became the Senior Pastor of New Sound Church (formerly Bankstown Baptist Church) in 2014. Raed and Fadia have one son – Joshua – and one daughter – Pascal – who serve with them in Church.',
                  'Raed-Haddad'),
              pastorsRight(
                  'Fadia Haddad',
                  'PASTOR',
                  'Fadia Haddad, also known as Fadia Bazzi, was born in Lebanon to a Muslim family. At age 14 she was introduced to Jesus and accepted Him as her saviour. She moved to Australia with her family in 1990 and shortly thereafter recorded her first Christian album. Fadia became famous among Arabic Christians around the world, and she has since been invited to sing at countless churches and conferences around the world. It was during one of these trips that she met Raed and he moved to Australia with her where they got married. They have one son – Joshua – and one daughter – Pascal – who serve with them in Church. Fadia continues to record Christian music in Arabic today.',
                  'Fadia-Haddad'),
              pastorsLeft(
                  'Andrew Wibawa',
                  'WORSHIP LEADER',
                  'Andrew began worship leading in 2007 and has been immersed in music since a young age. He loves using music as an expression of worship. Andrew has a heart to identify and raise future leaders and has a passion to raise up worshipers who take hold of their true identity and pursue intimacy with God above all else. Although he feels most at home on keys, you’ll see him mostly these days singing and playing acoustic! Andrew is married to Vivien and they have one daughter, Caitlyn.',
                  'Andrew-Wibawa'),
              createMap(),
              createContact(address, phone, email),
              const CreateFolloIcons(),
              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pastorsRight(
      String name, String position, String description, String image) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    position,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image(
              image: AssetImage("lib/Images/$image.png"),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget pastorsLeft(
      String name, String position, String description, String image) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage("lib/Images/$image.png"),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    position,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
