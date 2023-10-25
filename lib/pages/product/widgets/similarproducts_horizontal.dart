import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/posts.dart';
import 'package:smartphone_shop/pages/product/productpage.dart';
import 'package:smartphone_shop/providers/posts_provider.dart';

class SimilarProducts extends StatefulWidget {
  final Post product;
  const SimilarProducts({super.key, required this.product});

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(builder: (_, provider, __) {
      final List<Post> similars = provider.getSimilarProducts(widget.product);
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: similars.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            margin: const EdgeInsets.all(11),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<PostsProvider>(context, listen: false)
                            .getSimilarProducts(similars[index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                              product: similars[index],
                            ),
                          ),
                        );
                      },
                      child: Image.network(
                        similars[index].thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 6, bottom: 6, right: 10),
                        child: Text(
                          similars[index].title +
                              similars[index].price.toString().padLeft(10),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
