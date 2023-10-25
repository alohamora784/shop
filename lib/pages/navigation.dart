import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartphone_shop/pages/home/home.dart';

import 'package:smartphone_shop/pages/registration/resset_password.dart';
import 'package:smartphone_shop/pages/search/search.dart';
import 'package:smartphone_shop/pages/wishlist/wishlist.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const MyHome(),
    const PasswordResset(),
    const Search(),
    const WishList(),
  ];

  void navigatepage(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 145, 142, 142)),
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: BottomNavigationBar(
              selectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              onTap: navigatepage,
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svg/house.svg",
                    color: Colors.orange,
                  ),
                  icon: SvgPicture.asset(
                    "assets/svg/house.svg",
                  ),
                  label: "wtf",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svg/shop.svg",
                    color: Colors.orange,
                  ),
                  icon: SvgPicture.asset(
                    "assets/svg/shop.svg",
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svg/search.svg",
                    color: Colors.orange,
                  ),
                  icon: SvgPicture.asset(
                    "assets/svg/search.svg",
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svg/heart1.svg",
                    color: Colors.orange,
                  ),
                  icon: SvgPicture.asset(
                    "assets/svg/heart1.svg",
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svg/bell.svg",
                    color: Colors.orange,
                  ),
                  icon: SvgPicture.asset(
                    "assets/svg/bell.svg",
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
