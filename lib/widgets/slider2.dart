import 'package:flutter/material.dart';

class MySlider2 extends StatefulWidget {
  const MySlider2({super.key});

  @override
  State<MySlider2> createState() => _MySlider2State();
}

int currentPage = 0;

class _MySlider2State extends State<MySlider2> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (int page) {
        setState(() {
          currentPage = page;
        });
      },
      children: [
        productSlider(
          "assets/images/Rectangle 22.png",
        ),
        productSlider(
          "assets/images/ihpne1222.png",
        ),
        productSlider(
          "assets/images/Rectangle 22.png",
        ),
      ],
    );
  }

  productSlider(String img) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            img,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  height: 6,
                  width: 24,
                  decoration: BoxDecoration(
                      color: currentPage == 0 ? Colors.orange : Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  height: 6,
                  width: 24,
                  decoration: BoxDecoration(
                      color: currentPage == 1 ? Colors.orange : Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  height: 6,
                  width: 24,
                  decoration: BoxDecoration(
                      color: currentPage == 2 ? Colors.orange : Colors.white),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
