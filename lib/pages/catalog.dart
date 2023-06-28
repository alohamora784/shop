import 'package:flutter/material.dart';
import 'package:smartphone_shop/widgets/categories.dart';

import 'package:smartphone_shop/widgets/newgrid.dart';
import 'package:smartphone_shop/widgets/text_field.dart';

import '../widgets/slider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({super.key});

  @override
  State<MyCatalog> createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  final searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: MyTextField(
                controller: searchTextController,
                hintText: "Search",
                obscureTextON: false,
                keyboardType: TextInputType.text),
          ),
          const SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.only(left: 31, right: 31),
            child: MySlider(),
          ),
          const SizedBox(height: 44),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 31),
            child: Container(
              height: 110,
              child: MyCategories(),
            ),
          ),
          const SizedBox(height: 36),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.only(left: 31, right: 31),
            child: Container(
              child: MyGrid(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyImgSlider {}
