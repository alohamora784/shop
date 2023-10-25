import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String header;

  final bool hasIcon;
  const MyAppBar({super.key, required this.header, required this.hasIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leading: hasIcon
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Text(
        header,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
