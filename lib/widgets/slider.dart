import 'package:flutter/material.dart';
import 'package:smartphone_shop/pages/product.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

int currentPage = 0;

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      width: double.infinity,
      height: 371,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: PageView(
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
          children: [
            imageSlider(
                "assets/images/Rectangle 22.png", "iPhone 14 \n Pro Max"),
            imageSlider(
                "assets/images/samsung.png", "Samsung s22  \n Galaxy Ultra"),
            imageSlider("assets/images/p66.png", "Google\n Pixel 6 Pro"),
          ],
        ),
      ),
    );
  }

  imageSlider(String a, String b) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              if (currentPage == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductPage(),
                  ),
                );
              }
            },
            child: Image.asset(
              a,
              fit: BoxFit.cover,
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
                Container(
                  width: 90,
                  height: 2,
                  decoration: BoxDecoration(
                    color: currentPage == i ? Colors.orange : Colors.white,
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
              child: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ),
        )
      ],
    );
  }
}
