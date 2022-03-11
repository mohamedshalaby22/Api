import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FetchMovie {
  setMovie() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=05fedcf347e0378fc217ec45ce1c8b97&language=en-US'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
