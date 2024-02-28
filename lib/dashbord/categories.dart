import 'package:flutter/material.dart';
import 'package:onlineshes/navbar/brandspages/adidas.dart';
import 'package:onlineshes/navbar/brandspages/fila.dart';
import 'package:onlineshes/navbar/brandspages/new_balance.dart';
import 'package:onlineshes/navbar/brandspages/nike.dart';
import 'package:onlineshes/navbar/brandspages/preview.dart';
import 'package:onlineshes/navbar/brandspages/rebook.dart';

import '../variable/variables.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List categories = [
  const Preview(),
  const Adidas(),
  const Fila(),
  const NewBalance(),
  const Rebok(),
  const Nike(),
];
int currentPage = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: categories.length,
        initialIndex: 0,
        child: Scaffold(
            body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )),
                child: Stack(
                  children: [
                    Positioned(
                        left: 300,
                        top: 25,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.card_travel),
                        )),
                    Positioned(
                        left: 260,
                        top: 25,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        )),
                    Positioned(
                      top: 55,
                      left: 25,
                      child: Container(
                        width: 240,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: textColor),
                          automaticIndicatorColorAdjustment: false,
                          isScrollable: true,
                          dividerColor: Colors.grey,
                          mouseCursor: MouseCursor.defer,
                          indicatorColor: Colors.deepPurple,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 4,
                          padding: const EdgeInsets.all(10),
                          labelStyle: const TextStyle(
                              fontSize: 16, color: Colors.deepPurple),
                          unselectedLabelColor: Colors.grey[900],
                          unselectedLabelStyle: const TextStyle(
                              fontSize: fontsSize, fontFamily: 'Gumela'),
                          onTap: (pageValue) {
                            setState(() {
                              currentPage = pageValue;
                            });
                          },
                          tabs: const [
                            Tab(
                              text: " Preview",
                            ),
                            Tab(
                              text: " Fashion",
                            ),
                            Tab(
                              text: "Sport",
                            ),
                            Tab(
                              text: "home & kitchen",
                            ),
                            Tab(
                              text: "Beauty",
                            ),
                            Tab(
                              text: "Electronics",
                            ),
                          ]),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: double.infinity,
                        child: const TabBarView(
                          children: [
                            Preview(),
                            Adidas(),
                            Fila(),
                            NewBalance(),
                            Rebok(),
                            Nike(),
                          ],
                        )),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
