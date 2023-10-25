import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smartphone_shop/providers/categories_provider.dart';

import 'package:smartphone_shop/pages/search/widgets/categories_vertical.dart';

import 'package:smartphone_shop/widgets/text_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false).fetchCategory();
    super.initState();
  }

  final Searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(builder: (_, provider, __) {
      final List<String> Categories = provider.categories;

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
            for (var i = 0; i < Categories.length; i++)
              Padding(
                padding: const EdgeInsets.only(left: 31, right: 31),
                child: VerticalCategories(
                  category: Categories[i],
                ),
              ),
            const SizedBox(height: 14),
          ],
        ),
      );
    });
  }
}
