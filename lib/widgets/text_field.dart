import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureTextON;

  final TextInputType keyboardType;

  const MyTextField({
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
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 242, 242, 242),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 53,
        child: Stack(
          children: [
            TextField(
              
              controller: widget.controller,
              obscureText: obscureTextON,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                isDense: false,
                contentPadding: const EdgeInsets.only(left: 14),
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (widget.obscureTextON == true)
              Positioned(
                top: 17,
                right: 17,
                child: GestureDetector(
                  onTap: _toggleObscuring,
                  child: const Icon(Icons.visibility_rounded),
                ),
              )
          ],
        ),
      ),
    );
  }
}
