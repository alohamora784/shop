import 'package:flutter/material.dart';
import 'package:smartphone_shop/pages/registration/emailverification.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/text_field.dart';

class PasswordResset extends StatefulWidget {
  const PasswordResset({super.key});

  @override
  State<PasswordResset> createState() => _PasswordRessetState();
}

class _PasswordRessetState extends State<PasswordResset> {
  final emailTextController = TextEditingController();
  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(header: "", hasIcon: true,),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 46),
              const Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: Text(
                  "Reset password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: Text(
                  "Enter your email or phone nubmer",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 52),
              MyTextField(
                controller: emailTextController,
                hintText: "Username",
                keyboardType: TextInputType.text,
                obscureTextON: false,
              ),
            ],
          ),
          Positioned(
            bottom: 46,
            left: 31,
            right: 31,
            child: MyButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Verification()),
                );
              },
              name: "Continue",
            ),
          )
        ],
      ),
    );
  }
}
