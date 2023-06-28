import 'package:flutter/material.dart';
import 'package:smartphone_shop/pages/searchtext.dart';

class MyDropDown extends StatefulWidget {
  final String Header;
  final String item1;
  final String item2;
  final String item3;

  const MyDropDown({
    super.key,
    required this.Header,
    required this.item1,
    required this.item2,
    required this.item3,
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
                  widget.Header,
                  style: TextStyle(
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchText(),
                  ),
                );
              },
              child: Column(
                children: [
                  Text(
                    widget.item1,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.item2,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.item3,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
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
