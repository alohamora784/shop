import 'package:flutter/material.dart';

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({super.key});

  @override
  State<SimilarProducts> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  List<String> imageList = [
    'assets/images/ihpne1222.png',
    'assets/images/iphone12.png',
    'assets/images/iphone121.png',
    'assets/images/img.png',
  ];
  List<String> producList = [
    "iPhone 13 Pro \n 999.99 EUR",
    "iPhone 13 Pro \n 100.99 EUR",
    "iPhone 13 Pro \n 0.99 EUR",
    "iPhone 13 Pro \n 999.99 EUR",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageList.length,
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
                  child: Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
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
                      padding:  const EdgeInsets.only(left: 10, top: 6, bottom: 6, right: 10),
                      child: Text(producList[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
