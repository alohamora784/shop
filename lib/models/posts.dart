import 'package:flutter/foundation.dart';

import 'category.dart';

class Post {
  final String name;
  final double price;
  final String title;
  final String description;
  final int id;
  final String sliderimage;
  final List productsliderimages;
  final String brands;
  final DateTime uploadtime;
  final MyCategory category;
  String searchinfo() {
    return "$name  $title $description $brands$category".toLowerCase();
  }

  factory Post.fromJson(json) {
    return Post(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      sliderimage: json["image"],
      brands: "",
      name: json["title"],
      uploadtime: DateTime.now(),
      productsliderimages: [],
      category: MyCategory.headphones,
    );
  }
  Post({
    required this.name,
    required this.price,
    required this.title,
    required this.description,
    required this.id,
    required this.sliderimage,
    required this.productsliderimages,
    required this.brands,
    required this.uploadtime,
    required this.category,
  });
}
