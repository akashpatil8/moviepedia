import 'package:flutter/material.dart';

class HorizontalMovieCard extends StatelessWidget {
  final String imgUrl, movieTitle;
  final Function() onTap;
  const HorizontalMovieCard({
    super.key,
    required this.imgUrl,
    required this.movieTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.tertiary,
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 15,
                left: 15,
                child: SizedBox(
                  width: 200,
                  child: Text(
                    movieTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
