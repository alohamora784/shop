import 'package:flutter/material.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';

import '../../widgets/text_field.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final repeatpasswordTextController = TextEditingController();
  final phonenumberTextController = TextEditingController();
  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    repeatpasswordTextController.dispose();
    phonenumberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        header: 'Sign Up',
         hasIcon: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 70),
              MyTextField(
                controller: emailTextController,
                hintText: " Email",
                obscureTextON: false,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: passwordTextController,
                hintText: " Password",
                obscureTextON: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: repeatpasswordTextController,
                hintText: " Repeat Password",
                obscureTextON: true,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: phonenumberTextController,
                hintText: " Phone Number",
                obscureTextON: false,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 113),
            ],
          ),
          Positioned(
            left: 31,
            bottom: 50,
            right: 31,
            child: MyButton(
              onTap: () {},
              name: 'Continue',
            ),
          ),
        ],
      ),
    );
  }
}
