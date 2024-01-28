import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshes/dashbord/categories.dart';
import 'package:onlineshes/dashbord/details.dart';
import 'package:onlineshes/dashbord/profile.dart';
import 'package:provider/provider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../Statemangemant/themeprovider.dart';
import '../dashbord/cart.dart';
import '../dashbord/favorite.dart';
import '../variable/DataModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final dashboard = [
  const Categories(),
  Cart(),
  const Settings(),
  const Profile(),
];
int selectedIndex = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeprovider.darktheme
          ? const Color.fromARGB(255, 24, 24, 24)
          : Colors.white,
      bottomNavigationBar: WaterDropNavBar(
        inactiveIconColor: Colors.deepPurple,
        barItems: [
          BarItem(filledIcon: Icons.snowshoeing, outlinedIcon: Icons.snowshoeing),
          BarItem(
              filledIcon: Icons.add_shopping_cart_outlined,
              outlinedIcon: Icons.add_shopping_cart_outlined),
          BarItem(filledIcon: Icons.favorite, outlinedIcon: Icons.favorite),
          BarItem(filledIcon: Icons.person, outlinedIcon: Icons.person),
        ],
        selectedIndex: selectedIndex,
        onItemSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: dashboard[selectedIndex],
    );
  }
}
