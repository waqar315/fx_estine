import 'package:http/http.dart' as http;

import 'dart:convert';

Future<List> fetchWpPosts() async {
  final response = await http.get(
      Uri.parse(
          "https://fxesine.000webhostapp.com/index.php/wp-json/wp/v2/posts"),
      headers: {"Accept": "application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  return convertDatatoJson;
}

Future fetchWpPostImageUrl(href) async {
  final response =
      await http.get(Uri.parse(href), headers: {"Accept": "application/json"});
  var convertDatatoJson = jsonDecode(response.body);
  print('sssss $convertDatatoJson');
  return convertDatatoJson;
}
