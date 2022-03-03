import 'dart:convert';

import 'package:serviscim_app/models/post.dart';
import 'package:serviscim_app/src/user_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:serviscim_app/src/constant.dart';

class PostServices {
  String? token = UserPreferences.getToken();

  Future<List<Post>> getPostsAll() async {
    List<Post> postdata = [];
    try {
      var response = await http.post(Uri.parse(getPostUrl), headers: {
        //"Content-Type": "application/json",
        "Authorization": "Bearer " + token!
      });

      List map = jsonDecode(response.body);

      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future<List<Post>> getUserPostsAll() async {
    List<Post> postdata = [];
    try {
      var response = await http.post(Uri.parse(getuserPostUrl), headers: {
        //"Content-Type": "application/json",
        "Authorization": "Bearer " + token!
      });

      List map = jsonDecode(response.body);

      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future<List<Post>> getPostsAracIs() async {
    List<Post> postdata = [];
    try {
      var response = await http.post(Uri.parse(getPostUrl),
          body: jsonEncode({
            'type': 1,
          }),
          headers: {
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/json",
          });

      List map = jsonDecode(response.body);
      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future<List<Post>> getPostsIsArac() async {
    List<Post> postdata = [];
    try {
      var response = await http.post(Uri.parse(getPostUrl),
          body: jsonEncode({
            'type': 2,
          }),
          headers: {
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/json",
          });

      List map = jsonDecode(response.body);
      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future<List<Post>> getPostAracSofor() async {
    List<Post> postdata = [];
    try {
      var response = await http.post(Uri.parse(getPostUrl),
          body: jsonEncode({
            'type': 3,
          }),
          headers: {
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/json",
          });

      List map = jsonDecode(response.body);
      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future<List<Post>> getSoforIs() async {
    List<Post> postdata = [];
    try {
      var response = await http.post(Uri.parse(getPostUrl),
          body: jsonEncode({
            'type': 4,
          }),
          headers: {
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/json",
          });

      List map = jsonDecode(response.body);
      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future<List<Post>> getOzelGun() async {
    List<Post> postdata = [];
    try {
      var response = await http.post(Uri.parse(getPostUrl),
          body: jsonEncode({
            'type': 5,
          }),
          headers: {
            "Authorization": "Bearer " + token!,
            "Content-Type": "application/json",
          });

      List map = jsonDecode(response.body);
      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future<List<Post>> getFavorite() async {
    List<Post> postdata = [];
    try {
      var response = await http.get(Uri.parse(getUserFavoriteUrl), headers: {
        "Authorization": "Bearer " + token!,
        //"Content-Type": "application/json",
      });

      List map = jsonDecode(response.body);
      print(map);
      map.forEach((element) {
        postdata.add(Post.fromJson(element));
      });

      return postdata;
    } catch (e) {
      return postdata;
    }
  }

  Future addFavorite(int id) async {
    await http.post(Uri.parse(addFavUrl),
        body: jsonEncode({
          'id': id,
        }),
        headers: {
          "Authorization": "Bearer " + token!,
          "Content-Type": "application/json",
        });
  }
}
