import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:provider/provider.dart';

import 'package:smartphone_shop/models/posts.dart';
import 'package:smartphone_shop/providers/wishlist_provider.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/pages/product/widgets/product_img_slider.dart';

import 'widgets/similarproducts_horizontal.dart';

class ProductPage extends StatefulWidget {
  final Post product;

  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WishListProvider>(builder: (_, provider, __) {
      return Scaffold(
        appBar: MyAppBar(
          header: widget.product.title,
          
          hasIcon: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 330,
              child: ProductImgSlider(
                images: widget.product.productsliderimages,
              ),
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.only(left: 31, right: 31),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.product.title,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<WishListProvider>(context, listen: false)
                          .wishlistaddremove(widget.product);
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        widget.product.isselected
                            ? "assets/images/heart.png"
                            : "assets/images/heartorange.png",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 31, right: 31),
              child: Row(
                children: [
                  Text(
                    widget.product.price.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.orange,
                  ),
                  Text(widget.product.rating.toString()),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 31, right: 31),
              child: Container(
                decoration: const BoxDecoration(),
                child: ExpandableText(
                  widget.product.description,
                  readLessText: "Read less",
                  readMoreText: "Read more",
                  linkTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  trim: 6,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 59),
            Padding(
              padding: const EdgeInsets.only(right: 31, left: 31),
              child: MyButton(onTap: () {}, name: "Buy now"),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(right: 31, left: 31),
              child: MyButton(onTap: () {}, name: "Add to cart"),
            ),
            const SizedBox(height: 51),
            const Padding(
              padding: EdgeInsets.only(left: 31),
              child: Text(
                "Similar products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: SizedBox(
                height: 165,
                child: SimilarProducts(
                  product: widget.product,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
