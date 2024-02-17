import 'package:flutter/material.dart';

class RedLine_view extends StatelessWidget {
  final double top;
  final double left;
  final double height;
  final double width;

  RedLine_view({
    required this.top,
    required this.left,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: height,
        width: width,
        color: Colors.red,
      ),
    );
  }
}
