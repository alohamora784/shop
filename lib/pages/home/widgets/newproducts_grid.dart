import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/providers/posts_provider.dart';
import 'package:smartphone_shop/providers/wishlist_provider.dart';

import '../../product/productpage.dart';

class NewProductGrid extends StatefulWidget {
  const NewProductGrid({
    super.key,
  });

  @override
  State<NewProductGrid> createState() => _NewProductGridState();
}

class _NewProductGridState extends State<NewProductGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PostsProvider, WishListProvider>(
        builder: (_, firstprovider, secondprovider, __) {
      final newproducts = firstprovider.posts;

      return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 22,
            crossAxisSpacing: 22,
            childAspectRatio: 165 / 194,
          ),
          itemCount: newproducts.length > 10 ? 10 : newproducts.length,
          itemBuilder: (context, index) {
            Widget icon = Image.asset(
              newproducts[index].isselected
                  ? "assets/images/heart.png"
                  : "assets/images/heartorange.png",
            );

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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  product: newproducts[index],
                                ),
                              ),
                            );
                          },
                          child: Image.network(
                            newproducts[index].thumbnail,
                            fit: BoxFit.cover,
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
                                .wishlistaddremove(newproducts[index]);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: icon,
                          ),
                        ),
                      ),
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
                            child: Text(
                              newproducts[index].title +
                                  "   \$" +
                                  newproducts[index].price.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
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
