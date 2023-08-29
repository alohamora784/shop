import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:smartphone_shop/models/objectclass.dart';
import 'package:smartphone_shop/models/posts.dart';
import 'package:smartphone_shop/models/product_table.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/slider2.dart';

import '../widgets/similarproducts.dart';

class ProductPage extends StatefulWidget {
   final Post product;
  const ProductPage({super.key, required this.product, });

  @override
  State<ProductPage> createState() => _ProductPageState();
}



class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        header: widget.product.title,
        hasDivider: false, hasIcon: true,
      ),
      body: ListView(
        children: [
           SizedBox(
            height: 330,
            child: MySlider2(productimages: widget.product,),
          ),
          const SizedBox(height: 17),
           Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Text(
              widget.product.title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 4),
           Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Text(
              widget.product.price.toString(),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 31, right: 31),
            child: Container(
              
              decoration: const BoxDecoration(),
              child:  ExpandableText(
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
          const Padding(
            padding: EdgeInsets.only(left: 31),
            child: SizedBox(
              height: 165,
              child: SimilarProducts(),
            ),
          )
        ],
      ),
    );
  }
}
