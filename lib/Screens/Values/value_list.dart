import 'package:flutter/material.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'package:newsound/Screens/Values/values_functions.dart';

class ValueListItems {
  static final List<Widget> valueListItems = [
    //first container
    Container(
      height: 75.0,
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
          ),
          Expanded(
            child: Container(
              child: Text("Hey"),
              height: 75.0,
              margin: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange, width: 3),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 75.0,
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
          ),
          Expanded(
            child: Container(
              child: Text("Hey"),
              height: 75.0,
              margin: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange, width: 3),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 75.0,
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
          ),
          Expanded(
            child: Container(
              child: Text("Hey"),
              height: 75.0,
              margin: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange, width: 3),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 75.0,
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
          ),
          Expanded(
            child: Container(
              child: Text("Hey"),
              height: 75.0,
              margin: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange, width: 3),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 75.0,
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
          ),
          Expanded(
            child: Container(
              child: Text("Hey"),
              height: 75.0,
              margin: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange, width: 3),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 75.0,
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
          ),
          Expanded(
            child: Container(
              child: Text("Hey"),
              height: 75.0,
              margin: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.orange, width: 3),
              ),
            ),
          ),
        ],
      ),
    ),

    Container(
      height: 150.0,
      margin: EdgeInsets.all(10.0),
      child: CreateFolloIcons(),
    ),
    Container(
      height: 300.0,
      margin: EdgeInsets.all(10.0),
      child: CreateFeedbackBox(),
    ),
  ];
}
