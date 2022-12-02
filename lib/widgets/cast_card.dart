import 'package:flutter/material.dart';
import 'package:movieapp/widgets/text2.dart';

class CastCard extends StatelessWidget {
  final String imgUrl, castName, character;
  const CastCard(
      {super.key,
      required this.imgUrl,
      required this.castName,
      required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      width: 95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            // height: 40,
            child: Text2(
              text: castName,
              isBold: true,
            ),
          ),
          Text2(
            text: character,
            fontSize: 11,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
