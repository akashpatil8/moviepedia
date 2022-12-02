import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/controller/controller.dart';
import 'package:movieapp/api/api_constants.dart';
import 'package:movieapp/widgets/circular_indicator.dart';
import 'package:movieapp/widgets/fav_card.dart';
import 'package:movieapp/widgets/text1.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text1(
          text: 'Favourite Movies',
          fontSize: 22,
        ),
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<MovieController>(
        builder: (controller) {
          return movieController.trendingMovies.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return FavCard(
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.trendingMovies[index].posterPath
                                  .toString(),
                          title: movieController
                              .trendingMovies[index].originalTitle
                              .toString(),
                          overview: movieController
                              .trendingMovies[index].overview
                              .toString(),
                          rating: movieController
                              .trendingMovies[index].voteAverage!
                              .toStringAsFixed(1),
                          runtime: '125',
                          releaseDate: movieController
                              .trendingMovies[index].releaseDate
                              .toString(),
                        );
                      }),
                )
              : const CircleIndicator();
        },
      ),
    );
  }
}
