import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl, img;

  int rating = 0;

  Dog(this.name, this.location, this.description, this.img);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      // var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
      // var request = await http.getUrl(uri);
      // var response = await request.close();
      // var responseBody = await response.transform(utf8.decoder).join();

      imageUrl = img;
    } catch (exception) {
      print(exception);
    }
  }
}
