import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/address.dart';
import 'package:smartphone_shop/pages/AddressBook/editaddress.dart';

import '../providers/address_provider.dart';

class AddressBottomshet extends StatefulWidget {
  final int x;
  final AddressBook p;
  const AddressBottomshet({super.key, required this.x, required this.p});

  @override
  State<AddressBottomshet> createState() => _AddressBottomshetState();
}

class _AddressBottomshetState extends State<AddressBottomshet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          )),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 4,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(26),
              ),
            ),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.only(left: 31, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditAddress(x: widget.x, p: widget.p),
                      ),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Icon(
                            Icons.edit_document,
                            size: 40,
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Edit",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<AddressProvider>(context, listen: false).deleteAddress(widget.x);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 90,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 40,
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Delete",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
