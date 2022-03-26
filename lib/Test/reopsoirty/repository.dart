import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FetchDataFromApi {
  setData() async {
    try {
      final response =
          await http.get(Uri.parse('https://my-apis1.herokuapp.com/products'));
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);

        return body;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
