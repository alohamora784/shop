import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:smartphone_shop/models/pricefilter.dart';


import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/pages/search/search_result_page/modal_bottomsheet/bottomsheet.dart';
import 'package:smartphone_shop/widgets/loadingscreen.dart';
import 'package:smartphone_shop/pages/search/search_result_page/widgets/category_filter_grid.dart';
import 'package:http/http.dart' as http;

import '../../../models/posts.dart';

class CategoryResult extends StatefulWidget {
  final String category;

  const CategoryResult({
    super.key,
    required this.category,
  });

  @override
  State<CategoryResult> createState() => _CategoryResultState();
}

class _CategoryResultState extends State<CategoryResult> {
  List<Post>? filteredList;
  fetchdata() async {
    final response = await http.get(Uri.parse(
        "https://dummyjson.com/products/category/${widget.category}"));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body)["products"];
      filteredList = responseData.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products ');
    }
    setState(() {});
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (filteredList == null) {
      return const Scaffold(
        body: Center(
          child: LoadingScreen(),
        ),
      );
    } else {
      return Stack(
        children: [
          Scaffold(
            appBar: MyAppBar(
              header: widget.category[0].toUpperCase() +
                  widget.category.substring(1),
              
              hasIcon: true,
            ),
            body: ListView(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 31, right: 31),
                  child: GridCategory(filteredList: filteredList!),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: GestureDetector(
              onTap: showfilter,
              child: Image.asset(
                "assets/images/eqzualizer.png",
              ),
            ),
          ),
        ],
      );
    }
  }

  void showfilter() {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: ((context) {
          return const CategoryModalBottomSheet();
        })).then((value) {
      if (value == null || value.runtimeType != Filter) return;
      String minprice = value.minprice;
      String maxprice = value.maxprice;
      int filterValue = value.value;
      filteredList = filteredList
          ?.where((element) =>
              element.price >= double.parse(minprice) &&
              element.price <= double.parse(maxprice))
          .toList();
      if (filterValue == 1) {
        filteredList!.sort((a, b) => b.uploadtime.compareTo(a.uploadtime));
      }
      if (filterValue == 3) {
        filteredList!.sort((a, b) => b.price.compareTo(a.price));
      }
      if (filterValue == 2) {
        filteredList!.sort((a, b) => a.price.compareTo(b.price));
      }
      setState(() {});
    });
  }
}
