import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smartphone_shop/models/posts.dart';
import 'package:smartphone_shop/pages/product/productpage.dart';

import '../../../providers/posts_provider.dart';

class ProductsSlider extends StatefulWidget {
  const ProductsSlider({super.key});

  @override
  State<ProductsSlider> createState() => _ProductsSliderState();
}

class _ProductsSliderState extends State<ProductsSlider> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(builder: (_, provider, __) {
      final List<Post> products = provider.posts;

      return Container(
        decoration: const BoxDecoration(),
        width: double.infinity,
        height: 371,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length > 4 ? 4 : products.length,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return imageSlider(
                    products[index].thumbnail,
                    products[index].title,
                    products[index],
                  );
                },
              ),
              Positioned(
                bottom: 15,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 4; i++)
                      Flexible(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.only(right: 5, left: 5),
                          height: 2,
                          decoration: BoxDecoration(
                            color:
                                currentPage == i ? Colors.orange : Colors.black,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  imageSlider(
    String thumbnail,
    String title,
    Post item,
  ) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              Provider.of<PostsProvider>(context, listen: false)
                  .getSimilarProducts(item);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: item,
                  ),
                ),
              );
            },
            child: Align(
              child: Image.network(
                thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
