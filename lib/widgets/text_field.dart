import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  bool obscureTextON;

  final TextInputType keyboardType;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.obscureTextON,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool obscureTextON = widget.obscureTextON;
  void _toggleObscuring() {
    setState(() {
      obscureTextON = !obscureTextON;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 31,
        right: 31,
      ),
      child: SizedBox(
        height: 53,
        child: Stack(
          children: [
            TextField(
              controller: widget.controller,
              
              obscureText: obscureTextON,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                fillColor: const Color.fromARGB(255, 242, 242, 242),
                filled: true,
              ),
            ),
            if (widget.obscureTextON == true)
              Positioned(
                top: 17,
                right: 17,
                child: GestureDetector(
                  child: Icon(Icons.visibility_rounded),
                  onTap: _toggleObscuring,
                ),
              )
          ],
        ),
      ),
    );
  }
}
