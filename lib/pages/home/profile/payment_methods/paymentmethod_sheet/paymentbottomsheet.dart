import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../../../../../providers/card_provider.dart';

class PaymentBottomSheet extends StatefulWidget {
  final x;
  const PaymentBottomSheet({super.key, required this.x});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
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
                    _markDefault();
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
                            Icons.check_circle,
                            size: 40,
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Mark as default",
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
                    Provider.of<CardProvider>(context, listen: false)
                        .deleteCard(widget.x);
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

  void _markDefault() {
    Provider.of<CardProvider>(context, listen: false).markDefault(widget.x);

    Navigator.pop(context);
  }
}
