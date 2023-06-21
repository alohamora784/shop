import 'package:flutter/material.dart';
import 'package:smartphone_shop/pages/catalog.dart';
import 'package:smartphone_shop/pages/registration/resetpassword.dart';
import 'package:smartphone_shop/pages/registration/signup.dart';
import 'package:smartphone_shop/widgets/button.dart';

import '../../widgets/text_field.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: (ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 125, left: 31),
              child: Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 31),
              child: Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 150, 150, 150),
                ),
              ),
            ),
            const SizedBox(height: 57),
            MyTextField(
              controller: emailTextController,
              hintText: "Email",
              obscureTextON: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 25),
            MyTextField(
              controller: passwordTextController,
              hintText: "Password",
              obscureTextON: true,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PasswordResset()),
                  );
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 150, 150, 150),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 31, right: 31),
              child: MyButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyCatalog()),
                  );
                },
                name: "Sign in",
              ),
            ),
            const SizedBox(height: 45),
            const Center(
              child: Text(
                "Or sign in using",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 217, 217, 217)),
                    ),
                    child: const Center(
                      child: (Text(
                        "G",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 217, 217, 217)),
                    ),
                    child: const Center(
                      child: (Text(
                        "f",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 217, 217, 217)),
                    ),
                    child: const Center(
                      child: (Text(
                        "a",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 82),
            const Center(
              child: Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySignUp(),
                    ),
                  );
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
