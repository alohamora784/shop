import 'package:flutter/material.dart';
import 'package:smartphone_shop/models/objectclass.dart';
import 'package:smartphone_shop/models/posts.dart';

class MyGrid extends StatefulWidget {
  final List<Post> filteredList;
  const MyGrid({
    required this.filteredList,
    super.key,
  });

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 22,
        crossAxisSpacing: 22,
        childAspectRatio: 165 / 194,
      ),
      itemCount: widget.filteredList.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.black,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Image.network(
                      widget.filteredList[index].sliderimage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 8,
                    right: 8,
                    child: Container(
                      height: 41,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 6),
                        child: Text(
                          widget.filteredList[index].name +
                              widget.filteredList[index].price.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
