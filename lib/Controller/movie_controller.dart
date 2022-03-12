import 'package:fetch/Models/model.dart';
import 'package:fetch/Repository/movie_repo.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MovieController extends GetxController {
  FetchMovie fetchMovie = FetchMovie();
  var isLoading = false.obs;
  var movielist = <MovieModel>[].obs;
  var favouriteList = <MovieModel>[].obs;
  var storage = GetStorage();
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
      favouriteList
          .add(movielist.firstWhere((element) => element.id == movieId));
      await storage.write('isFavourite', favouriteList);
    }
  }

  bool isFavourite(int movieId) {
    return favouriteList.any((element) => element.id == movieId);
  }
}
