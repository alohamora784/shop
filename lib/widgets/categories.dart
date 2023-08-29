import 'package:flutter/material.dart';


import '../models/category.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  
  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: MyCategory.items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14),
          ),
          margin: const EdgeInsets.all(11),
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7, top: 7),
            child: Column(
              children: [
                Image.network(
                  MyCategory.items[index].img,
                  height: 45,
                ),
                Text(
                  MyCategory.items[index].name,
                  style: const TextStyle(
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
