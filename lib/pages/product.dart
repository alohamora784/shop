import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/slider2.dart';

import '../widgets/similarproducts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

int currentpage = 0;

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        header: 'iPhone 13',
        HasDivider: false,
      ),
      body: ListView(
        children: [
          Container(
            height: 330,
            child: MySlider2(),
          ),
          const SizedBox(height: 17),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Text(
              "iPhone 13 Pro",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.only(left: 31, right: 31),
            child: Text(
              "999.99 EUR",
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
              
              decoration: BoxDecoration(),
              child: const ExpandableText(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                readLessText: "Read less",
                readMoreText: "Read more",
                linkTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                trim: 6,
                style: TextStyle(
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
            child: Container(
              height: 165,
              child: SimilarProducts(),
            ),
          )
        ],
      ),
    );
  }
}
