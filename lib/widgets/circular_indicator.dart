import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  final double width, height;
  const CircleIndicator({super.key, this.width = 180.0, this.height = 270.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryTextTheme.bodyText1?.color,
        ),
      ),
    );
  }
}
