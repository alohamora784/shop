import 'package:flutter/material.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  List<String> imageList = [
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
    'assets/images/img.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          margin: EdgeInsets.all(11),
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7, top: 7),
            child: Column(
              children: [
                Image.asset(imageList[index]),
                const Text(
                  "Smartphones",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
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
