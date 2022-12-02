import 'package:flutter/material.dart';

class VerticalMovieCard extends StatelessWidget {
  final String imgUrl;
  final Function() onTap;
  final double width;
  const VerticalMovieCard(
      {super.key, required this.imgUrl, required this.onTap, this.width = 180,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.only(left: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
