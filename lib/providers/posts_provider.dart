import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/posts.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  get length => null;

  Future<void> fetchPosts() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products/"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      _posts = responseData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
    notifyListeners();
  }
}
