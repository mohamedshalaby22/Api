// ignore_for_file: non_constant_identifier_names

class MovieModel {
  String? original_title, overview, poster_path;
  num? vote_average;
  MovieModel(
      {required this.original_title,
      required this.overview,
      required this.poster_path,
      required this.vote_average});
  MovieModel.fromJson(Map<String, dynamic> json) {
    original_title = json['original_title'];
    overview = json['overview'];
    poster_path = json['poster_path'];
    vote_average = json['vote_average'];
  }
  toJson() {
    return {
      'original_title': original_title,
      'overview': overview,
      'poster_path': poster_path,
      'vote_average': vote_average,
    };
  }
}
