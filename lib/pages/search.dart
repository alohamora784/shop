import 'package:flutter/material.dart';
import 'package:smartphone_shop/models/category.dart';
import 'package:smartphone_shop/widgets/brands.dart';
import 'package:smartphone_shop/widgets/categoriesdropdown.dart';

import 'package:smartphone_shop/widgets/text_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final Searchcontroller = TextEditingController();
  int index = 0;
  bool IsExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 30),
          MyTextField(
            controller: Searchcontroller,
            hintText: "Search",
            keyboardType: TextInputType.text,
            obscureTextON: false,
          ),
          const SizedBox(height: 57),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 31),
          for (var i = 0; i < MyCategory.items.length; i++)
            Padding(
              padding: EdgeInsets.only(left: 31, right: 31),
              child: MyDropDown(category: MyCategory.items[i],),
            ),
          const SizedBox(height: 14),
          const SizedBox(height: 61),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Text(
              "Brands",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 28),
          const SizedBox(
            height: 45,
            child: MyBrands(),
          ),
          const SizedBox(height: 12),
          const SizedBox(
            height: 45,
            child: MyBrands(),
          ),
          const SizedBox(height: 12),
          const SizedBox(
            height: 45,
            child: MyBrands(),
          ),
        ],
      ),
    );
  }
}
