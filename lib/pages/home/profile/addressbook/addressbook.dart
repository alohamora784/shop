import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/address.dart';
import 'package:smartphone_shop/pages/home/profile/addressbook/addnewaddress/addnewaddress.dart';
import 'package:smartphone_shop/widgets/addressbottomsheet.dart';
import 'package:smartphone_shop/widgets/appbar.dart';

import '../../../../providers/address_provider.dart';

class AddressBookPage extends StatefulWidget {
  const AddressBookPage({super.key});

  @override
  State<AddressBookPage> createState() => _AddressBookPageState();
}

class _AddressBookPageState extends State<AddressBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(header: "Address book", hasIcon: true),
      body: Consumer<AddressProvider>(
        builder: (_,provider,__) {
          final List<AddressBook> book = provider.addressBook;
          return ListView(
            padding: const EdgeInsets.only(
              left: 31,
              right: 31,
            ),
            children: [
              const SizedBox(height: 35),
              for (var i = 0; i < book.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          book[i].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isDismissible: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) {
                                return AddressBottomshet(
                                  x: i,
                                  p: book[i],
                                );
                              },
                            ).then((value) {
                              setState(() {});
                            });
                          },
                          child: const Icon(Icons.more_vert_rounded),
                        ),
                      ],
                    ),
                    Text(
                      book[i].address,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book[i].apartment,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book[i].phoneNumber,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.grey,
                      height: 0,
                    ),
                    const SizedBox(height: 21),
                  ],
                ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddNewAddress(),
                      ),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: const Text(
                    "+ Add new address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
