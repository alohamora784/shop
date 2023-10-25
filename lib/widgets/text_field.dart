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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Container(
        decoration: BoxDecoration(),
        height: 53,
        child: Stack(
          children: [
            TextField(
              controller: widget.controller,
              obscureText: obscureTextON,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                isDense: false,
                
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), //  line color when clicked
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.grey.shade200), //  line color when not clicked
                ),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle:  TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            if (widget.obscureTextON == true)
              Positioned(
                top: 17,
                right: 17,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureTextON = !obscureTextON;
                    });
                  },
                  child: obscureTextON == true
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.grey.shade800,
                        )
                      : const Icon(
                          Icons.visibility_rounded,
                          color: Colors.black,
                        ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
