import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smartphone_shop/providers/wishlist_provider.dart';

class WishListCategories extends StatefulWidget {
  final List<String> categories;
  const WishListCategories({super.key, required this.categories});

  @override
  State<WishListCategories> createState() => _WishListCategoriesState();
}

class _WishListCategoriesState extends State<WishListCategories> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WishListProvider>(builder: (_, firstprovider, __) {
      String? savedcategory = firstprovider.savedCategory;
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          bool isselected = widget.categories[index] == savedcategory;
          Color boxColor = isselected ? Colors.orange : Colors.grey.shade300;
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<WishListProvider>(context, listen: false)
                        .getcategory(widget.categories[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: boxColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 14, right: 14),
                      child: Text(
                        widget.categories[index][0].toUpperCase() +
                            widget.categories[index]
                          ..substring(1),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
