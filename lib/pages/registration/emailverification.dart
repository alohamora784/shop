import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartphone_shop/pages/registration/new_password.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final pincodecontroller = TextEditingController();
  @override
  void dispose() {
    pincodecontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(header: "",  hasIcon: true,),
      body: Stack(
        children: [
          ListView(
            children: [
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: Text(
                  "Code sent to:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: Text(
                  "username@gmail.com",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 31, right: 31),
                child: PinCodeTextField(
                  textStyle: const TextStyle(
                    fontSize: 32,
                  ),
                  cursorColor: Colors.black,
                  hintCharacter: "0",
                  keyboardType: TextInputType.number,
                  controller: pincodecontroller,
                  appContext: context,
                  length: 4,
                  pinTheme: PinTheme(
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    borderWidth: 2,
                    shape: PinCodeFieldShape.underline,
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 100),
              const Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receieve code?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Resend",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
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
                    MaterialPageRoute(builder: (context) => const NewPassword()),
                  );
                },
                name: "Confirm"),
          )
        ],
      ),
    );
  }
}
