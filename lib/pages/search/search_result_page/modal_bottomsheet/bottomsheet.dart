import 'package:flutter/material.dart';

import 'package:smartphone_shop/models/pricefilter.dart';
import 'package:smartphone_shop/widgets/button.dart';
import 'package:smartphone_shop/pages/search/search_result_page/modal_bottomsheet/widgets/radiobutton.dart';



class CategoryModalBottomSheet extends StatefulWidget {
  const CategoryModalBottomSheet({super.key});

  @override
  State<CategoryModalBottomSheet> createState() => _CategoryModalBottomSheetState();
}

class _CategoryModalBottomSheetState extends State<CategoryModalBottomSheet> {
  int selectedindex = 0;
  final minpricetextcontroller = TextEditingController();
  final maxpricetextcontroller = TextEditingController();
  @override
  void dispose() {
    minpricetextcontroller.dispose();
    maxpricetextcontroller.dispose();
    super.dispose();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    const Text("Min"),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: minpricetextcontroller,
                        decoration: const InputDecoration(
                          hintText: "\$",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Max"),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: maxpricetextcontroller,
                        decoration: const InputDecoration(
                          hintText: "\$",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
            MyButton(
                onTap: () {
                  Navigator.pop(
                      context,
                      Filter(
                          minprice: minpricetextcontroller.text,
                          maxprice: maxpricetextcontroller.text,
                          value: selectedindex));
                },
                name: "Filter"),
          ],
        ),
      ),
    );
  }
}
