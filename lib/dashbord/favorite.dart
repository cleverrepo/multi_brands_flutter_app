import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshes/Statemangemant/themeprovider.dart';
import 'package:onlineshes/variable/constants.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

final ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
);
final ThemeData darkthem = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    textTheme:  ThemeData.dark().textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.purple,

    )
        );

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          
          body: Column(

            children: [
Expanded(child: Container()),
              Expanded(
                flex: 2,
                child: ListView(
                  children: [

                    ListTile(
                      trailing: Container(
                        width: secondaryWidth,
                        height: secondaryHeight,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(Icons.notifications),
                      ),
                      title: const Text(
                        "Notifications",
                        style:
                            TextStyle(fontWeight: fontWeight, fontSize: fontsize),
                      ),
                    ),
                    ListTile(
                      trailing: Container(
                        width: secondaryWidth,
                        height: secondaryHeight,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(Icons.security),
                      ),
                      title: const Text(
                        "Security",
                        style:
                            TextStyle(fontWeight: fontWeight, fontSize: fontsize),
                      ),
                    ),
                    ListTile(
                      trailing: Container(
                        width: secondaryWidth,
                        height: secondaryHeight,
                        decoration: BoxDecoration(
                            color: arbitraryColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(
                          Icons.group,
                          color: subColor,
                        ),
                      ),
                      title: const Text(
                        "Contact Us",
                        style:
                            TextStyle(fontWeight: fontWeight, fontSize: fontsize),
                      ),
                    ),

                  ],
                ),
              )
            ],
          )),
    );
  }
}
