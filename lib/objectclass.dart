import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String title;
  final String description;
  final int id;
  final List sliderimages;
  final String brands;
  final DateTime uploadtime;
  final String categories;

  Product({
    required this.name,
    required this.price,
    required this.title,
    required this.description,
    required this.id,
    required this.sliderimages,
    required this.brands,
    required this.uploadtime,
    required this.categories,
  });
  List<Product> items = [
    Product(
      name: "iPhone 14 Pro Max",
      price: 999.99,
      title: "iPhone 14 Pro Max",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
      id: 123,
      sliderimages: <String>[
        "assets/images/Rectangle 22.png",
        "assets/images/ihpne1222.png",
        "assets/images/Rectangle 22.png",
      ],
      brands: "iPhone",
      uploadtime: DateTime.now(),
      categories: "Smartphones",
    ),
  ];
}
