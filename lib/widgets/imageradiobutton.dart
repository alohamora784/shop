

import 'package:flutter/material.dart';

class ImageRadioButton extends StatefulWidget {
  final int value;
  int groupvalue;
  final ValueChanged<int> onChanged;
  final String image;

  ImageRadioButton({
    super.key,
    required this.value,
    required this.groupvalue,
    required this.onChanged,
    required this.image,
  });

  @override
  State<ImageRadioButton> createState() => _ImageRadioButtonState();
}

class _ImageRadioButtonState extends State<ImageRadioButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: () {},
      child: Container(
        height: 100,
        width: 150,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Radio(
              value: widget.value,
              groupValue: widget.groupvalue,
              onChanged: (value) {
                widget.onChanged(widget.value);
              },
            ),
            Image.network(widget.image),
          ],
        ),
      ),
    );
  }
}
