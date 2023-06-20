import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String header;
  bool HasDivider;
   MyAppBar({super.key, required this.header, required this.HasDivider});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
        header,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      flexibleSpace: HasDivider == true ?  const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ) : Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}