import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Dog {
  Dog({required this.name, required this.location, required this.description});

  final String name;
  final String location;
  final String description;
  String? imageUrl;

  int rating = 10;

  Future getImageUrl() async {
    if (imageUrl != null) return;

    final HttpClient http = HttpClient();
    try {
      final uri = Uri.http("dog.ceo", "/api/breeds/image/random");
      final request = await http.getUrl(uri);
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      imageUrl = json.decode(responseBody)["message"];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
