import 'package:flutter/material.dart';



class ProductImgSlider extends StatefulWidget {
  final List images;
  const ProductImgSlider({
    super.key,
    required this.images,
  });

  @override
  State<ProductImgSlider> createState() => _ProductImgSliderState();
}

class _ProductImgSliderState extends State<ProductImgSlider> {
  int _currentPage = 0;
  @override
  void initState() {
    int _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: widget.images.length,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              widget.images[index],
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          bottom: 15,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < widget.images.length; i++)
                Flexible(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    height: 2,
                    decoration: BoxDecoration(
                      color: _currentPage == i ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
