import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/carddata.dart';
import 'package:smartphone_shop/models/objectclass.dart';
import 'package:smartphone_shop/models/posts.dart';
import 'package:smartphone_shop/models/product_table.dart';
import 'package:smartphone_shop/pages/product.dart';
import 'package:http/http.dart' as http;

import '../providers/posts_provider.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int currentPage = 0;
  

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsProvider>(
      builder: (_,provider,__) {
        final List<Post> products = provider.posts;
        return Container(
          decoration: BoxDecoration(),
          width: double.infinity,
          height: 371,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length > 3 ? 3 : products.length,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                  
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return imageSlider(
                    products[index].sliderimage, products[index].name, products[index]);
              },
            ),
          ),
        );
      }
    );
  }

  imageSlider(String a, String b, Post post) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: post,
                  ),
                ),
              );
            },
            child: Align(
              child: Image.network(
                a,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 3; i++)
                Flexible(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    height: 2,
                    decoration: BoxDecoration(
                      color: currentPage == i ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: 50,
          left: 20,
          child: Text(
            b,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
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
        )
      ],
    );
  }
}
