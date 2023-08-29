import 'package:flutter/material.dart';
import 'package:smartphone_shop/models/objectclass.dart';
import 'package:smartphone_shop/models/product_table.dart';
import 'package:smartphone_shop/widgets/appbar.dart';
import 'package:smartphone_shop/widgets/bottomsheet.dart';
import 'package:smartphone_shop/widgets/newgrid.dart';

import '../models/posts.dart';

class SearchText extends StatefulWidget {
  var searchString;

  SearchText({
    this.searchString,
    super.key,
  });

  @override
  State<SearchText> createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  List<Post> filteredList = [];

  bool isvisible = false;
  void toggleVisibility() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  void initState() {
    super.initState();

    filteredList = ProductTable.items
        .where((element) => element
            .searchinfo()
            .toLowerCase()
            .contains(widget.searchString.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: MyAppBar(header: widget.searchString, hasDivider: true, hasIcon: true,),
          body: ListView(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 31, right: 31),
                child: MyGrid(filteredList: filteredList),
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
                  })).then((value) {
                    if (value == 1) {
                  filteredList.sort((a, b) => b.uploadtime.compareTo(a.uploadtime));
                  setState(() {});
                }
                if (value == 3) {
                  filteredList.sort((a, b) => b.price.compareTo(a.price));
                  setState(() {});
                }
                if (value == 2) {
                  filteredList.sort((a, b) => a.price.compareTo(b.price));
                  setState(() {});
                }
              });
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
