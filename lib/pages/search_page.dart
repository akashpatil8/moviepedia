import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/constants/constants.dart';
import 'package:movieapp/controller/controller.dart';
import 'package:movieapp/api/api_constants.dart';
import 'package:movieapp/widgets/icon_widget.dart';
import 'package:movieapp/widgets/text1.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MovieController movieController = Get.put(MovieController());
  String query = '';
  final formKey = GlobalKey<FormState>();

  Widget getSearch() {
    return GetBuilder<MovieController>(builder: (controller) {
      return movieController.searchedMovies.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.52),
              itemCount: movieController.searchedMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    movieController.getDetail(
                        movieController.searchedMovies[index].id.toString());
                    movieController.getCastList(
                        movieController.searchedMovies[index].id.toString());
                    movieController.getSimilar(
                        movieController.searchedMovies[index].id.toString());
                    Get.toNamed('/deatils');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          ApiConstants.baseImgUrl +
                              movieController.searchedMovies[index].posterPath
                                  .toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              })
          : const Center(child: Text1(text: 'Search any Movie!'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text1(
          text: 'Search Movies',
          fontSize: 22,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12.0, left: 12, right: 12),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: Center(
              child: TextFormField(
                key: formKey,
                onChanged: (value) {
                  query = value;
                },
                autofocus:
                    movieController.searchedMovies.isEmpty ? true : false,
                cursorColor:
                    Theme.of(context).primaryTextTheme.bodyText1?.color,
                decoration: InputDecoration(
                  hintText: 'Enter Movie Name',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const IconWidget(
                      iconPath: MyIcons.search,
                    ),
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild?.unfocus();
                      }
                      movieController.getMovieSearch(query);
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 20),
            child: Text1(text: 'Top Results'),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
              height: double.maxFinite,
              child: getSearch(),
            ),
          ),
        ],
      ),
    );
  }
}
