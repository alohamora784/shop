import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesProvider with ChangeNotifier {
  final List<String> _categories = [];

  List<String> get categories => _categories;
  List<String> get getfirsthalf =>
      _categories.sublist(0, _categories.length ~/ 2);
  List<String> get getsecondhalf =>
      _categories.sublist(_categories.length ~/ 2);

  Future<void> fetchCategory() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/products/categories"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      for (var item in responseData) {
        _categories.add(item.toString());
      }
    } else {
      throw Exception('Failed to load categories ');
    }
    notifyListeners();
  }
}
