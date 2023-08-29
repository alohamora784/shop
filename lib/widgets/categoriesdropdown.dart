import 'package:flutter/material.dart';
import 'package:smartphone_shop/models/category.dart';

import 'package:smartphone_shop/pages/searchtext.dart';

class MyDropDown extends StatefulWidget {
  MyCategory category;

  MyDropDown({
    super.key,
    required this.category,
  });

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  bool IsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                IsExpanded = !IsExpanded;
              });
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.category.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                IsExpanded
                    ? const Icon(Icons.keyboard_arrow_up_outlined,
                        color: Colors.black)
                    : const Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.black),
              ],
            ),
          ),
          if (IsExpanded) ...[
            Column(
              children: [
                for (var i = 0; i < widget.category.brands.length; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchText(
                            searchString: widget.category.brands[i],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      widget.category.brands[i],
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                SizedBox(height: 10),
              ],
            ),
          ],
          const Divider(
            color: Color.fromARGB(255, 247, 225, 225),
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
