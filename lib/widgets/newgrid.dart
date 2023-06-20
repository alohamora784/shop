import 'package:flutter/material.dart';

class MyGrid extends StatefulWidget {
  const MyGrid({super.key});

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      'assets/images/iphone12pro.png',
      "assets/images/Rectangle 22.png",
      "assets/images/samsung.png",
      "assets/images/p66.png",
      'assets/images/img.png',
      'assets/images/img.png',
    ];
    List <String> nameList = [
      "iPhone 12 Pro \n 750 € ",
      "iPhone 13 Pro \n 999.99 € ",
      "Samsung s22 Galaxy \n 800.99 € ",
      "Google Pixel 6 \n 1000.99 € ",
      "iPhone 13 Pro \n 999.99 € ",
      "iPhone 13 Pro \n 999.99 € ",
    ];
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 22,
        crossAxisSpacing: 22,
        childAspectRatio: 165/194,
      ),
      itemCount: imgList.length,
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
                    child: Image.asset(
                      imgList[index],
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
                      child:   Padding(
                        padding: const EdgeInsets.only(left: 10,top: 6),
                        child: Text(
                          nameList[index],
                          style: TextStyle(
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
