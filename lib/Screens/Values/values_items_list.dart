import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class ValueListItems {
  static final List<Widget> valueListItems = [
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "KINGDOM PEOPLE",
                textStyle: GoogleFonts.dancingScript(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  //color: Colors.amberAccent,
                ),
                speed: const Duration(milliseconds: 150),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                'We live in such a way that our faith permeates everything that we do. Every aspect of our life is in alignment with the teachings of Jesus and reveals the true value and worth of His kingdom to those around us.',
                style: GoogleFonts.montserrat(
                    fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "SPIRIT LED",
                textStyle: GoogleFonts.dancingScript(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  //color: Colors.amberAccent,
                ),
                speed: const Duration(milliseconds: 150),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                'While the Bible is our supreme authority, the Holy Spirit is our guide - without the ministry of the Holy Spirit, we will ot have full access to the Word.',
                style: GoogleFonts.montserrat(
                    fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "FATHER'S HEART",
                textStyle: GoogleFonts.dancingScript(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  //color: Colors.amberAccent,
                ),
                speed: const Duration(milliseconds: 150),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                'Jesus came to restore our relationship with the Father. We are sons, not slaves. The Father Himself loves us and sees us as His own children.',
                style: GoogleFonts.montserrat(
                    fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "WORD LED",
                textStyle: GoogleFonts.dancingScript(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  //color: Colors.amberAccent,
                ),
                speed: const Duration(milliseconds: 150),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                "Jesus taught that we don't live by bread alone but by every word that comes from the mouth of God - the Bible is the supreme authority that governs everything we beleive.",
                style: GoogleFonts.montserrat(
                    fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "FRUITS & GIFTS",
                textStyle: GoogleFonts.dancingScript(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  //color: Colors.amberAccent,
                ),
                speed: const Duration(milliseconds: 150),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                'We seek to grow in manifesting the fruits of the Spirit in our lives. We also seek after the fruits of the Holy Spirit and we value the prophetic gifting.',
                style: GoogleFonts.montserrat(
                    fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "AMBASSADORS",
                textStyle: GoogleFonts.dancingScript(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  //color: Colors.amberAccent,
                ),
                speed: const Duration(milliseconds: 150),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                "Our message is one of reconciliation. God is not imputing people's sins against them.",
                style: GoogleFonts.montserrat(
                    fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    ),
  ];
}
