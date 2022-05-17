import 'package:flutter/material.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'explore_list.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      addList();
    });
  }

  List<Widget> exploreList = [];

  void addList() {
    final List<Widget> exploreListItems = List.from(exploreItemList);
    //print(exploreListItems); //prnting on the console for test purpopse

    Future future = Future(() {}); //creating a future instance

    exploreListItems.forEach((Widget) {
      future = future.then((_) {
        //delay the animation by 100 ms
        return Future.delayed(const Duration(milliseconds: 100), () {
          //add items to the list that will be used for animation, from exploreListItems
          exploreList.add(Widget);
          //update the key and the current state
          _exploreListKey.currentState!.insertItem(exploreList.length - 1);
        });
      });
    });
  }

//generate global key for the animation
  final _exploreListKey = GlobalKey<AnimatedListState>();

  //create tween/offset for animation to put into position
  final Tween<Offset> _offSet = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Explore"))),
      body: AnimatedList(
        physics: BouncingScrollPhysics(),
        key: _exploreListKey, //key
        padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
        initialItemCount: exploreList.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            child: exploreList[index],
            position: animation.drive(_offSet),
          );
        },
      ),
    );
  }
}
