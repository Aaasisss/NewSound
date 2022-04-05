import 'package:flutter/material.dart';
import 'package:newsound/Screens/Values/value_list.dart';
import 'package:newsound/Screens/Values/values_functions.dart';
import 'value_list.dart';

class Values extends StatefulWidget {
  const Values({Key? key}) : super(key: key);

  @override
  State<Values> createState() => _ValuesState();
}

class _ValuesState extends State<Values> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      addList();
    });
  }

  List<Widget> valueListItems = [];

  void addList() {
    //copy value from viewListItems from value list class
    final valueList = List.from(ValueListItems.valueListItems);

    //make an instance of future
    Future future = Future(() {});

    valueList.forEach((Widget) {
      //iterate through the list
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          //add to the list to display/animate
          valueListItems.add(Widget);
          //update the state
          _valueListKey.currentState!.insertItem(valueListItems.length - 1);
        });
      });
    });
  }

  //create key
  final _valueListKey = GlobalKey<AnimatedListState>();

  final Tween<Offset> _offSet = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Values"))),
      body: Center(
        child: Column(
          children: [
            // SizedBox(
            //   height: 500,
            // ),
            Expanded(
              child: AnimatedList(
                scrollDirection: Axis.vertical,
                key: _valueListKey,
                padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                initialItemCount: valueListItems.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                      child: valueListItems[index],
                      position: animation.drive(_offSet));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
