import 'package:flutter/material.dart';
import 'package:newsound/Screens/Values/values_items_list.dart';
import 'package:newsound/Screens/Values/values_functions.dart';
import 'package:newsound/Shared/follow_us.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Values extends StatefulWidget {
  const Values({Key? key}) : super(key: key);

  @override
  State<Values> createState() => _ValuesState();
}

class _ValuesState extends State<Values> {
  //create controller
  final swipeController = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("VALUES"))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 3),
              child: Stack(
                children: [
                  LiquidSwipe(
                    liquidController: swipeController,
                    //initialPage: 0,
                    enableSideReveal: true,
                    onPageChangeCallback: (index) {
                      setState(() {});
                    },
                    waveType: WaveType.liquidReveal,
                    slideIconWidget: const Icon(Icons.arrow_back_ios),
                    pages: ValueListItems.valueListItems,
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AnimatedSmoothIndicator(
                            activeIndex: swipeController.currentPage,
                            count: 6,
                            effect: const WormEffect(
                              spacing: 16,
                              dotColor: Colors.white,
                              activeDotColor: Colors.red,
                            ),
                            onDotClicked: (index) {
                              swipeController.animateToPage(page: index);
                              //print(swipeController.currentPage);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CreateFolloIcons(),
            const CreateFeedbackSection(),
          ],
        ),
      ),
    );
  }
}
