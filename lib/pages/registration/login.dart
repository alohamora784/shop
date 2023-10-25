import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/pages/registration/resset_password.dart';
import 'package:smartphone_shop/pages/registration/signup.dart';
import 'package:smartphone_shop/providers/user_provider.dart';

import 'package:smartphone_shop/widgets/button.dart';
import 'package:http/http.dart' as http;
import 'package:smartphone_shop/pages/navigation.dart';

import '../../models/users.dart';

import '../../widgets/text_field.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  List<Users> _users = [];

  @override
  void dispose() {
    usernameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  bool IsError = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: (ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 125, left: 15),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
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
                controller: usernameTextController,
                hintText: "Username",
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
              const SizedBox(height: 10),
              IsError == true
                  ? const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Username or Password is not Correct",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : Container(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordResset()),
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
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 31, right: 31),
                child: MyButton(
                  onTap: () {
                    if (isUserValid(
                      usernameTextController.text,
                      passwordTextController.text,
                    )) {
                      Provider.of<UserProvider>(context, listen: false)
                          .getuserdata(usernameTextController.text, _users);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyNavBar()),
                      );
                    } else {
                      IsError = true;
                      
                    }
                    setState(() {});
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
                        builder: (context) => const MySignUp(),
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
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/users"),
    );
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body)["users"];
      _users = responseData.map((json) => Users.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users ');
    }
    setState(() {});
  }

  bool isUserValid(String username, String password) {
    for (var user in _users) {
      if (user.username == username.toLowerCase() &&
          user.password == password) {
        return true;
      }
    }
    return false;
  }
}
