import 'package:flutter/material.dart';

import '../pages/searchtext.dart';

class MyBrands extends StatefulWidget {
  const MyBrands({super.key});

  @override
  State<MyBrands> createState() => _MyBrandsState();
}

class _MyBrandsState extends State<MyBrands> {
  List<String> BrandsList = [
    "Samsung",
    "Huawei",
    "iPhone",
    "Xiaomi",
    "Samsung",
    "Huawei",
    "iPhone",
    "Xiaomi",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: BrandsList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchText(),
                  ),
                );
                    },
                    child: Text(
                      BrandsList[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
