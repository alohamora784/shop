import 'package:flutter/material.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/bottomsheet.dart';
import 'package:smartphone_shop/widgets/newgrid.dart';

class SearchText extends StatefulWidget {
  const SearchText({super.key});

  @override
  State<SearchText> createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  bool isvisible = false;
  void toggleVisibility() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: MyAppBar(header: "Search Text", HasDivider: true),
          body: ListView(
            children: const [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: MyGrid(),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 50,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isDismissible: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: ((context) {
                    return BotomShet();
                  }));
            },
            child: Image.asset(
              "assets/images/eqzualizer.png",
            ),
          ),
        ),
      ],
    );
  }
}
