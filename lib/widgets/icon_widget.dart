import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String iconPath;
  final double iconSize;
  const IconWidget({super.key, required this.iconPath, this.iconSize = 25});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(iconPath),
      size: iconSize,
      color: Theme.of(context).primaryTextTheme.bodyText1?.color,
    );
  }
}
