import 'package:flutter/material.dart';
import 'package:smartphone_shop/pages/registration/login.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final newpasswordcontroller = TextEditingController();
  final repeatpasswordcontroller = TextEditingController();
  @override
  void dispose() {
    newpasswordcontroller.dispose();
    repeatpasswordcontroller.dispose();
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
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: Text(
                  "Enter new password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 49),
              MyTextField(
                controller: newpasswordcontroller,
                hintText: "Password",
                keyboardType: TextInputType.text,
                obscureTextON: false,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: repeatpasswordcontroller,
                hintText: "Repeat Password",
                keyboardType: TextInputType.text,
                obscureTextON: false,
              ),
            ],
          ),
          Positioned(
            bottom: 46,
            left: 31,
            right: 31,
            child: MyButton(onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyLogin()),
                );
            }, name: "Confirm"),
          )
        ],
      ),
    );
  }
}
