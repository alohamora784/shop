import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/address.dart';
import 'package:smartphone_shop/providers/address_provider.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/text_field.dart';

class EditAddress extends StatefulWidget {
  final int x;
  final AddressBook p;
  const EditAddress({super.key, required this.x, required this.p});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  late final nameTextController = TextEditingController(text: widget.p.name);
  late final cityTextController = TextEditingController(text: widget.p.city);
  late final addressTextController =
      TextEditingController(text: widget.p.address);
  late final apartmentTextController =
      TextEditingController(text: widget.p.apartment);
  late final phoneTextController =
      TextEditingController(text: widget.p.phoneNumber);
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

  void WarningPopUp(BuildContext context) {
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
        header: "Edit address",
        
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
            child: MyButton(onTap: _editAddress, name: "Save"),
          ),
        ],
      ),
    );
  }

  void _editAddress() {
    if (nameTextController.text.isEmpty ||
        addressTextController.text.isEmpty ||
        apartmentTextController.text.isEmpty ||
        phoneTextController.text.isEmpty ||
        cityTextController.text.isEmpty) {
      WarningPopUp(context);
      return;
    }
    Provider.of<AddressProvider>(context, listen: false).editAddress(
        AddressBook(
          address: addressTextController.text,
          apartment: apartmentTextController.text,
          city: cityTextController.text,
          name: nameTextController.text,
          phoneNumber: phoneTextController.text,
        ),
        widget.x);
    Navigator.pop(context);
  }
}
