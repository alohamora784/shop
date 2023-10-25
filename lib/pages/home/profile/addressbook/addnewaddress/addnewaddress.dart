

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/address.dart';
import 'package:smartphone_shop/widgets/appbar.dart';

import '../../../../../providers/address_provider.dart';
import '../../../../../widgets/button.dart';
import '../../../../../widgets/text_field.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final nameTextController = TextEditingController();
  final cityTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final apartmentTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final comentTextController = TextEditingController();
  @override
  void dispose() {
    nameTextController.dispose();
    cityTextController.dispose();
    addressTextController.dispose();
    apartmentTextController.dispose();
    phoneTextController.dispose();
    comentTextController.dispose();
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
      appBar: const MyAppBar(
        header: "Add address",
        
        hasIcon: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 35),
          MyTextField(
              controller: nameTextController,
              hintText: "Full name",
              keyboardType: TextInputType.text,
              obscureTextON: false),
          const SizedBox(height: 25),
          MyTextField(
              controller: cityTextController,
              hintText: "City",
              keyboardType: TextInputType.text,
              obscureTextON: false),
          const SizedBox(height: 25),
          MyTextField(
              controller: addressTextController,
              hintText: "Address",
              keyboardType: TextInputType.text,
              obscureTextON: false),
          const SizedBox(height: 25),
          MyTextField(
              controller: apartmentTextController,
              hintText: "Apartment/Floor",
              keyboardType: TextInputType.text,
              obscureTextON: false),
          const SizedBox(height: 25),
          MyTextField(
              controller: phoneTextController,
              hintText: "Phone number",
              keyboardType: TextInputType.number,
              obscureTextON: false),
          const SizedBox(height: 25),
          MyTextField(
              controller: comentTextController,
              hintText: "Aditional coment",
              keyboardType: TextInputType.text,
              obscureTextON: false),
          const SizedBox(height: 56),
          Padding(
            padding: const EdgeInsets.only(left: 31, right: 31),
            child: MyButton(onTap: _addAddress, name: "Add"),
          )
        ],
      ),
    );
  }

  void _addAddress() {
    if (nameTextController.text.isEmpty ||
        addressTextController.text.isEmpty ||
        apartmentTextController.text.isEmpty ||
        phoneTextController.text.isEmpty ||
        cityTextController.text.isEmpty) {
      warningPopUp();
      return;
    }
    Provider.of<AddressProvider>(context, listen: false).addAddress(
      AddressBook(
          name: nameTextController.text,
          address: addressTextController.text,
          apartment: apartmentTextController.text,
          phoneNumber: phoneTextController.text,
          city: cityTextController.text),
    );

    Navigator.pop(context);
  }
}
