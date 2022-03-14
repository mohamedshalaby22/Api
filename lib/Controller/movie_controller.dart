import 'package:fetch/Models/model.dart';
import 'package:fetch/Repository/movie_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MovieController extends GetxController {
  FetchMovie fetchMovie = FetchMovie();
  var isLoading = false.obs;
  var movielist = <MovieModel>[].obs;
  var favouriteList = <MovieModel>[].obs;
  var storage = GetStorage();
  var searchList = <MovieModel>[].obs;
  var text = TextEditingController();
//FormField
  RxBool onPressed = false.obs;
  void changePressed() {
    onPressed.value = !onPressed.value;
  }

  MovieController() {
    getMovie();
    List? storgeFavourite = storage.read<List>('isFavourite');
    if (storgeFavourite != null) {
      favouriteList =
          storgeFavourite.map((e) => MovieModel.fromJson(e)).toList().obs;
    }
  }
  getMovie() async {
    isLoading(true);
    var myList = await fetchMovie.setMovie();
    movielist.value =
        myList.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
    isLoading(false);
    update();
  }

  //favorite screen
  void changeFavorite(int movieId) async {
    var index = favouriteList.indexWhere((element) => element.id == movieId);
    if (index >= 0) {
      favouriteList.removeAt(index);
      await storage.remove('isFavourite');
    } else {
      var searchId = movielist.firstWhere((element) => element.id == movieId);
      favouriteList.add(searchId);
      await storage.write('isFavourite', favouriteList);
    }
  }

  bool isFavourite(int movieId) {
    return favouriteList.any((element) => element.id == movieId);
  }

  void searchListChange(String value) {
    searchList.value = movielist
        .where((search) => search.original_title!.toLowerCase().contains(value))
        .toList();
    update();
  }

  void clearSearch() {
    text.clear();
    searchListChange('');
  }
}
