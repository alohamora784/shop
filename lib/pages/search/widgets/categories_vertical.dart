import 'package:flutter/material.dart';

import '../search_result_page/resultcategory.dart';

class VerticalCategories extends StatefulWidget {
  String category;

  VerticalCategories({
    super.key,
    required this.category,
  });

  @override
  State<VerticalCategories> createState() => _VerticalCategoriesState();
}

class _VerticalCategoriesState extends State<VerticalCategories> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryResult(category: widget.category,),
                ),
              );
            },
            child: Text(
              widget.category[0].toUpperCase() + widget.category.substring(1),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 247, 225, 225),
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }
}
