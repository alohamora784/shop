import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/carddata.dart';
import 'package:smartphone_shop/providers/card_provider.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/text_field.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final cardholdernamecontroller = TextEditingController();
  final cardnumbercontroller = TextEditingController();
  final expirydatecontroller = TextEditingController();
  final cvvcontroller = TextEditingController();
  String selectedvalue = "Mastercard";
  @override
  void dispose() {
    cardholdernamecontroller.dispose();
    cardnumbercontroller.dispose();
    expirydatecontroller.dispose();
    cvvcontroller.dispose();
    super.dispose();
  }

  void warningPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('ALL THE FIELDS ARE NOT FILLED'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(header: "Add card",  hasIcon: true),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 31, right: 31),
            child: DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: "Mastercard",
                  child: Text(
                    "Visa/Mastercard",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: "Paypal",
                  child: Text(
                    "Paypal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
              value: selectedvalue,
              onChanged: (value) {
                setState(() {
                  selectedvalue = value!;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          if (selectedvalue == "Mastercard")
            Column(
              children: [
                MyTextField(
                  controller: cardholdernamecontroller,
                  hintText: "cardholdername",
                  keyboardType: TextInputType.text,
                  obscureTextON: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: cardnumbercontroller,
                  hintText: "cardnumber",
                  keyboardType: TextInputType.number,
                  obscureTextON: false,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: MyTextField(
                        controller: expirydatecontroller,
                        hintText: "expirydate",
                        keyboardType: TextInputType.number,
                        obscureTextON: false,
                      ),
                    ),
                    Flexible(
                      child: MyTextField(
                        controller: cvvcontroller,
                        hintText: "cvv",
                        keyboardType: TextInputType.number,
                        obscureTextON: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 45),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 31,
                    right: 31,
                  ),
                  child: MyButton(
                    onTap: _addCard,
                    name: "Save",
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _addCard() {
    if (cardholdernamecontroller.text.isEmpty ||
        cardnumbercontroller.text.isEmpty ||
        expirydatecontroller.text.isEmpty ||
        cvvcontroller.text.isEmpty) {
      warningPopUp();
      return;
    }
    Provider.of<CardProvider>(context, listen: false).addCard(
      CardData(
          type: selectedvalue,
          cardholdername: cardholdernamecontroller.text,
          cardnumber: cardnumbercontroller.text,
          expirydate: expirydatecontroller.text,
          cvv: cvvcontroller.text,
          IsDefault: false),
    );

    Navigator.pop(context);
  }
}
