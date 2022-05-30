import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkingHelper {
  String url;

  NetworkingHelper({required this.url});

  Future getData() async {
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
