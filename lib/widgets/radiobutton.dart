import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final int value;
  int groupvalue;
  final String text;
  final ValueChanged<int> onChanged;

  RadioButton({
    super.key,
    required this.groupvalue,
    required this.value,
    required this.text,
    required this.onChanged,
  });

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text),
        Radio(
          value: widget.value,
          groupValue: widget.groupvalue,
          onChanged: ( value) {
            widget.onChanged(widget.value);
          },
        ),
      ],
    );
  }
}
