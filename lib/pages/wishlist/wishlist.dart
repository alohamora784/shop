import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/posts.dart';
import 'package:smartphone_shop/providers/wishlist_provider.dart';
import 'package:smartphone_shop/pages/wishlist/widgets/wishlist_categories.dart';
import 'package:smartphone_shop/pages/wishlist/widgets/wishlist_listview.dart';

import '../../providers/categories_provider.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<WishListProvider, CategoriesProvider>(
        builder: (_, firstprovider, secondprovider, __) {
      final List<Post> wishList = firstprovider.wishlist;
      final List<String> categories = secondprovider.categories;
      

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: ListView(
            children: [
              const SizedBox(height: 35),
              const Text(
                "Wishlist",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Text("${wishList.length}  items"),
              const SizedBox(height: 29),
              SizedBox(
                height: 41,
                child: WishListCategories(categories: categories),
              ),
              if (wishList.isEmpty)
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                        height: 164,
                        width: 164,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Image.asset("assets/images/brokenheart.png")),
                    const SizedBox(height: 32),
                    const Column(
                      children: [
                        Text("Your Wishlist is empty. Add products to"),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(" your Wishlist for a quick access"),
                      ],
                    ),
                  ],
                ),
              if (wishList.isNotEmpty)
                WishListListview(wishlist: firstprovider.getFilteredWishlist)
            ],
          ),
        ),
      );
    });
  }
}
