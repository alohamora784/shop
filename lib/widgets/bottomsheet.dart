import 'package:flutter/material.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/widgets/radiobutton.dart';

class BotomShet extends StatefulWidget {
  const BotomShet({super.key});

  @override
  State<BotomShet> createState() => _BotomShetState();
}

class _BotomShetState extends State<BotomShet> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      height: 600,
      child: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              "Sort By",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 29),
            RadioButton(
              value: 1,
              text: "Recently added",
              groupvalue: selectedindex,
              onChanged: (value) {
                setState(() {
                  selectedindex = value;
                });
              },
            ),
            RadioButton(
              value: 2,
              text: "Price: Low to High",
              groupvalue: selectedindex,
              onChanged: (value) {
                setState(() {
                  selectedindex = value;
                });
              },
            ),
            RadioButton(
              value: 3,
              text: "Price: High to Low",
              groupvalue: selectedindex,
              onChanged: (value) {
                setState(() {
                  selectedindex = value;
                });
              },
            ),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 18),
            const Text(
              "Filter By",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 29),
            const Row(
              children: [
                Text(
                  "Date",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  "Price",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  "Status",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 30),
            MyButton(onTap: () {
              Navigator.pop(context, selectedindex);
            }, name: "Filter"),
          ],
        ),
      ),
    );
  }
}
