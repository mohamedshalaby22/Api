import 'package:fetch/Models/model.dart';
import 'package:fetch/Repository/movie_repo.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  FetchMovie fetchMovie = FetchMovie();
  var isLoading = false.obs;
  var movielist = <MovieModel>[].obs;
  MovieController() {
    getMovie();
  }
  getMovie() async {
    isLoading(true);
    var myList = await fetchMovie.setMovie();
    movielist.value =
        myList.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
    isLoading(false);
    update();
  }
}
