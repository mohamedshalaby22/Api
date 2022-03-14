// ignore_for_file: non_constant_identifier_names

class MovieModel {
  String? original_title, overview, backdrop_path, poster_path;
  num? vote_average;
  int? id;

  MovieModel(
      {required this.original_title,
      required this.id,
      required this.overview,
      required this.poster_path,
      required this.backdrop_path,
      required this.vote_average});
  MovieModel.fromJson(Map<String, dynamic> json) {
    original_title = json['original_title'];
    id = json['id'];
    overview = json['overview'];
    poster_path = json['poster_path'];
    backdrop_path = json['backdrop_path'];
    vote_average = json['vote_average'];
  }
  toJson() {
    return {
      'original_title': original_title,
      'id': id,
      'overview': overview,
      'poster_path': poster_path,
      'backdrop_path': backdrop_path,
      'vote_average': vote_average,
    };
  }
}
