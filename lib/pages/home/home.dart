import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/users.dart';
import 'package:smartphone_shop/pages/home/profile/profile_page.dart';
import 'package:smartphone_shop/providers/user_provider.dart';

import 'package:smartphone_shop/pages/home/widgets/categories_horizontal.dart';

import 'package:smartphone_shop/pages/home/widgets/newproducts_grid.dart';
import 'package:smartphone_shop/widgets/text_field.dart';

import '../../providers/categories_provider.dart';
import '../../providers/posts_provider.dart';
import 'widgets/saleproducts_grid.dart';
import 'widgets/products_slider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PostsProvider>(context, listen: false).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoriesProvider, UserProvider>(
        builder: (_, firstprovider, secondprovider, __) {
      final List<String> firstHalf = firstprovider.getfirsthalf;
      final List<String> secondHalf = firstprovider.getsecondhalf;
      final List<Users> userdata = secondprovider.users;
      return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30 ,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: MyTextField(
                        controller: searchTextController,
                        hintText: "Search",
                        obscureTextON: false,
                        keyboardType: TextInputType.text),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 31),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      child: Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade200,
                        ),
                        child: Image.network(userdata[0].image),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 44),
            const Padding(
              padding: EdgeInsets.only(left: 31, right: 31),
              child: ProductsSlider(),
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
              child: Column(
                children: [
                  SizedBox(
                    height: 41,
                    child: MyCategories(
                      categories: firstHalf,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 41,
                    child: MyCategories(
                      categories: secondHalf,
                    ),
                  ),
                ],
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
            const Padding(
              padding: EdgeInsets.only(left: 31, right: 31),
              child: NewProductGrid(),
            ),
            const SizedBox(height: 38),
            const Padding(
              padding: EdgeInsets.only(left: 31, right: 31),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sale",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 31, right: 31),
              child: SaleProducts(),
            ),
          ],
        ),
      );
    });
  }
}
