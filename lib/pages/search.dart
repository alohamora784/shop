import 'package:flutter/material.dart';
import 'package:smartphone_shop/widgets/Brands.dart';
import 'package:smartphone_shop/widgets/categoriesdropdown.dart';

import 'package:smartphone_shop/widgets/text_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final Searchcontroller = TextEditingController();

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
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: MyDropDown(
              Header: "Smartphones",
              item1: "Samsung",
              item2: "Iphone",
              item3: "Xiaomi",
            ),
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: MyDropDown(
              Header: "Tablets",
              item1: "Apple",
              item2: "OnePlus",
              item3: "Samsung Tab",
            ),
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: MyDropDown(
              Header: "Smart Watches",
              item1: "Apple",
              item2: "Garmin",
              item3: "Amazfit",
            ),
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: MyDropDown(
              Header: "Headphones",
              item1: "Sony",
              item2: "Sennheiser",
              item3: "Apple",
            ),
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: MyDropDown(
              Header: "Cameras",
              item1: "Sony",
              item2: "Nikon",
              item3: "Canon",
            ),
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: MyDropDown(
              Header: "Accessories",
              item1: "Watch",
              item2: "Glasses",
              item3: "Begs",
            ),
          ),
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
          Container(
            height: 45,
            child: MyBrands(),
          ),
          const SizedBox(height: 12),
          Container(
            height: 45,
            child: MyBrands(),
          ),
          const SizedBox(height: 12),
          Container(
            height: 45,
            child: MyBrands(),
          ),
        ],
      ),
    );
  }
}
