import 'package:flutter/material.dart';
import 'package:smartphone_shop/widgets/button.dart';

class BotomShet extends StatefulWidget {
  const BotomShet({super.key});

  @override
  State<BotomShet> createState() => _BotomShetState();
}

bool isvisible = false;

class _BotomShetState extends State<BotomShet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      height: 600,
      child: Padding(
        padding: const EdgeInsets.only(left: 22, right: 22),
        child: ListView(
          children: [
            SizedBox(height: 15),
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
            SizedBox(height: 28),
            const Text(
              "Sort By",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 29),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recently added",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  "Price: High to low",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  "Price: Low to high",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 54),
            const Text(
              "Filter By",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 29),
            const Row(
              children: [
                Text(
                  "Date",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  "Price",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 18),
            const Row(
              children: [
                Text(
                  "Status",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 30),
            MyButton(onTap: () {}, name: "Filter"),
          ],
        ),
      ),
    );
  }
}
