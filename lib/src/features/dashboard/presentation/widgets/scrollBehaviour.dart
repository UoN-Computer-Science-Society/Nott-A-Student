import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class scrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
