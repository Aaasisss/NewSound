import 'package:flutter/material.dart';
import 'package:newsound/Screens/About/about_us.dart';
import 'package:newsound/Screens/Explore/explore.dart';
import 'package:newsound/Screens/Home/home.dart';
import 'package:newsound/Screens/Values/our_values.dart';
import 'package:newsound/Screens/Watch/watch.dart';

final PageController controller = PageController(
  initialPage: 1,
);

final pageView = PageView(
    controller: controller,
    scrollDirection: Axis.horizontal,
    children: const [
      HomePage(),
      About(),
      Explore(),
      Values(),
      Watch(),
    ]);
