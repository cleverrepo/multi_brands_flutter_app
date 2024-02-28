import 'package:flutter/material.dart';
import 'package:onlineshes/dashbord/cart.dart';
import 'package:onlineshes/dashbord/categories.dart';
import 'package:onlineshes/dashbord/favorite.dart';
import 'package:onlineshes/dashbord/profile.dart';

import 'package:wave_navigation_bar/wave_navigation_bar.dart';

import '../variable/variables.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

List pages = [const Home(), Cart(), const Settings(), const Profile()];

int currentIndex = 0;
final _bottomNavigationKey = GlobalKey<WaveNavigationBarState>();

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: WaveNavigationBar(
        key: _bottomNavigationKey,
        animationCurve: Curves.linearToEaseOut,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.orange.shade50,
        buttonBackgroundColor: Colors.orange,
        selectedIconBackgrounColor: textColor,
        index: currentIndex,
        onChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.shopping_cart_checkout),
          Icon(Icons.favorite),
          Icon(Icons.person),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
