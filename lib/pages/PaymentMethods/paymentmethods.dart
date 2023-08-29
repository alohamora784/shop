import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartphone_shop/models/carddata.dart';
import 'package:smartphone_shop/pages/PaymentMethods/addnewcard.dart';
import 'package:smartphone_shop/providers/card_provider.dart';

import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/imageradiobutton.dart';
import 'package:smartphone_shop/widgets/paymentbottomsheet.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(header: "Payment Methods", hasDivider: true, hasIcon: true),
      body: Consumer<CardProvider>(builder: (_, provider, __) {
        final List<CardData> data = provider.cardBook;
        return ListView(
          padding: const EdgeInsets.only(
            left: 31,
            right: 31,
          ),
          children: [
            SizedBox(height: 35),
            for (var i = 0; i < data.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            data[i].type,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          data[i].IsDefault == true
                              ? Icon(Icons.check)
                              : Container(),
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isDismissible: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) {
                                return PaymentBottomSheet(
                                  x: i,
                                );
                              },
                            ).then((value) {
                              setState(() {});
                            });
                          },
                          child: const Icon(Icons.more_vert_rounded)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data[i].cardholdername,
                  ),
                  const SizedBox(height: 4),
                  Text(data[i].cardnumber),
                  const SizedBox(height: 4),
                  Text(data[i].expirydate),
                  const SizedBox(height: 4),
                  Text(data[i].cvv),
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.grey,
                    height: 0,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddNewCard(),
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
              child: const Text(
                "+ Add New Card",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
