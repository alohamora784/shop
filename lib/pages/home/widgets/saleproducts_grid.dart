import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/posts_provider.dart';
import '../../../providers/wishlist_provider.dart';

class SaleProducts extends StatefulWidget {
  const SaleProducts({super.key});

  @override
  State<SaleProducts> createState() => _SaleProductsState();
}

class _SaleProductsState extends State<SaleProducts> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PostsProvider, WishListProvider>(
        builder: (_, firstprovider, secondrovider, __) {
      final discountedproducts = firstprovider.posts;
      return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 22,
            crossAxisSpacing: 22,
            childAspectRatio: 165 / 194,
          ),
          itemCount:
              discountedproducts.length > 6 ? 6 : discountedproducts.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.black,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.network(
                            discountedproducts[index].thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 5,
                          left: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 7, left: 7),
                              child: Text(
                                  "-${discountedproducts[index].discountPercentage}%"),
                            ),
                          )),
                      Positioned(
                        bottom: 5,
                        left: 8,
                        right: 8,
                        child: Container(
                          height: 41,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 6),
                            child: Text.rich(
                              TextSpan(
                                text: discountedproducts[index].title,
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        ' \$${discountedproducts[index].price}',
                                  ),
                                  TextSpan(
                                    text:
                                        '\$${(discountedproducts[index].price * 100 / (100 - discountedproducts[index].discountPercentage)).round()}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 6,
                        right: 6,
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<WishListProvider>(context,
                                    listen: false)
                                .wishlistaddremove(discountedproducts[index]);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Image.asset(
                              discountedproducts[index].isselected
                                  ? "assets/images/heart.png"
                                  : "assets/images/heartorange.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
