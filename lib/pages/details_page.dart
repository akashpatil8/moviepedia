import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/constants/constants.dart';
import 'package:movieapp/controller/controller.dart';
import 'package:movieapp/api/api_constants.dart';
import 'package:movieapp/widgets/bottom_bar_button.dart';
import 'package:movieapp/widgets/cast_card.dart';
import 'package:movieapp/widgets/circular_indicator.dart';
import 'package:movieapp/widgets/icon_widget.dart';
import 'package:movieapp/widgets/text1.dart';
import 'package:movieapp/widgets/text2.dart';
import 'package:movieapp/widgets/title_text.dart';
import 'package:movieapp/widgets/vertical_movie_card.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GetBuilder<MovieController>(builder: (controller) {
        return ListView(
          children: [
            Container(
              height: 600,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(
                  image: NetworkImage(
                    ApiConstants.baseImgUrl +
                        movieController.movies.value.posterPath.toString(),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
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
                      bottom: 30,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 270,
                                child: TitleText(
                                  title: movieController
                                      .movies.value.originalTitle
                                      .toString(),
                                ),
                              ),
                              Row(
                                children: const [
                                  IconWidget(iconPath: MyIcons.share),
                                  SizedBox(width: 20),
                                  IconWidget(iconPath: MyIcons.favourite)
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: MyColors.kAccentColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    'IMDB  ${movieController.movies.value.voteAverage?.toStringAsFixed(1)}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 18),
                              const IconWidget(
                                  iconPath: MyIcons.time, iconSize: 20),
                              Text2(
                                text:
                                    ' ${movieController.movies.value.runtime.toString()} min',
                                fontSize: 16,
                              ),
                              const SizedBox(width: 18),
                              const IconWidget(
                                  iconPath: MyIcons.calendar, iconSize: 20),
                              Text2(
                                text:
                                    ' ${movieController.movies.value.releaseDate.toString()}',
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8),
              child: Text1(text: 'Overview'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 20),
              child: Text2(
                text: movieController.movies.value.overview.toString(),
                maxLines: 5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8),
              child: Text1(text: 'Cast'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              height: 210,
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieController.movieCast.length <= 10
                      ? movieController.movieCast.length
                      : 10,
                  itemBuilder: (context, index) {
                    return movieController.movieCast.isNotEmpty
                        ? CastCard(
                            imgUrl: ApiConstants.baseImgUrl +
                                movieController.movieCast[index].profilePath
                                    .toString(),
                            castName: movieController.movieCast[index].name
                                .toString(),
                            character: movieController
                                .movieCast[index].character
                                .toString(),
                          )
                        : const CircleIndicator();
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
              child: Text1(text: 'Similar Movies'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              height: 180,
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: movieController.similarMovies.isNotEmpty
                  ? ListView.builder(
                      itemCount: movieController.similarMovies.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return VerticalMovieCard(
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.similarMovies[index].posterPath
                                  .toString(),
                          onTap: () {
                            setState(() {
                              movieController.getDetail(movieController
                                  .similarMovies[index].id
                                  .toString());
                              movieController.getCastList(movieController
                                  .similarMovies[index].id
                                  .toString());
                              movieController.getSimilar(movieController
                                  .similarMovies[index].id
                                  .toString());
                              Get.toNamed('/deatils');
                            });
                          },
                          width: 95,
                        );
                      })
                  : const CircleIndicator(),
            ),
          ],
        );
      }),
      bottomNavigationBar: const BottomBarButton(),
    );
  }
}
