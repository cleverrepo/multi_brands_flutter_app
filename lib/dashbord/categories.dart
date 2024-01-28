import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshes/Statemangemant/stateprovider.dart';
import 'package:onlineshes/navbar/brandspages/nike.dart';
import 'package:onlineshes/navbar/brandspages/skechers.dart';
import 'package:onlineshes/variable/constants.dart';
import 'package:provider/provider.dart';

import '../Statemangemant/themeprovider.dart';
import '../UserAuth/login.dart';
import '../navbar/brandspages/adidas.dart';
import '../navbar/brandspages/fila.dart';
import '../navbar/brandspages/new_balance.dart';
import '../navbar/brandspages/puma.dart';
import '../navbar/brandspages/rebook.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

List brandPages = [
  // const All(),
  const Puma(),
  const Skechers(),
  const Adidas(),
  const Nike(),
  const Fila(),
  const Rebok(),
  const NewBalance(),
];

List<String> brandNames = [
  "All",
  "Puma",
  "Adidas",
  "Fila",
  "Rebook",
  "NewBal",
  "Nike"
];
int currentPage = 0;
int selecetedTab = -1;
bool iconClicked = false;
final GlobalKey<SliderDrawerState> _sliderDrawerKey =
    GlobalKey<SliderDrawerState>();
FirebaseAuth auth=FirebaseAuth.instance;
class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: DefaultTabController(
            length: brandPages.length,
            child: Scaffold(
              backgroundColor: themeprovider.darktheme
                  ? const Color.fromARGB(255, 24, 24, 24)
                  : Colors.white,
              body: SliderDrawer(
                animationDuration: 500,
                slideDirection: SlideDirection.LEFT_TO_RIGHT,
                key: _sliderDrawerKey,
                appBar: SliderAppBar(
                  trailing: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Badge(
                        label: Consumer<ProviderManagement>(
                          builder: (BuildContext context,
                              ProviderManagement value, Widget? child) {
                            return Text("${value.x}");
                          },
                        ),
                        child: const Icon(Icons.notifications)),
                  ),
                  appBarHeight: 50,
                  title: const Text(
                    "Walk Faster",
                    style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    textAlign: TextAlign.start,
                  ),
                ),
                slider: Container(
                  color: themeprovider.darktheme
                      ? const Color.fromARGB(255, 24, 24, 24)
                      : Colors.white,
                  child: ListView(children: [
                     DrawerHeader(
                        child: Column(children: [
                      CircleAvatar(
                        radius: 40,

                      ),
                          Text(
                            "${auth.currentUser!.email}",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                    ])),
                    ListTile(
                      trailing: Switch(
                        value: Provider.of<ThemeProvider>(context).darkTheme,
                        onChanged: (val) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggledTheme();
                        },
                      ),
                      title: const Text(
                        "Dark Mode",
                        style: TextStyle(
                            fontWeight: fontWeight, fontSize: fontsize),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        "Account",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: themeprovider.darktheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.person_outline,
                        size: 25,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        " Notifications",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: themeprovider.darktheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.notifications,
                        size: 25,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        "Order tracking ",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: themeprovider.darktheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.car_crash_outlined,
                        size: 25,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        "Orders ",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: themeprovider.darktheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.add_shopping_cart,
                        size: 25,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      trailing: const Icon(
                        Icons.headset_mic_outlined,
                        size: 35,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        " support ",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: themeprovider.darktheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      title: Text(
                        "Privacy Policy ",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: themeprovider.darktheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.privacy_tip_outlined,
                        size: 25,
                        color: Colors.deepPurple,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        FirebaseAuth.instance
                            .signOut()
                            .then((value) => Get.to(() => const Login()));
                      },
                      trailing: const Icon(
                        Icons.logout,
                        size: 25,
                        color: Colors.deepPurple,
                      ),
                      title: const Text(
                        "Sign out",
                        style: TextStyle(
                            fontWeight: fontWeight, fontSize: fontsize),
                      ),
                    ),
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.deepPurple,
                                size: 25,
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  fontSize: 18, color: Colors.deepPurple),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width:1,color: Colors.deepPurple
                                )
                              )),
                        ),
                      ),
                      TabBar(
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
                            fontSize: fontsize,
                          ),
                          onTap: (pageValue) {
                            setState(() {
                              currentPage = pageValue;
                            });
                          },
                          tabs: const [

                            Tab(
                              text: " Sketcers",
                            ),
                            Tab(
                              text: "puma",
                            ),

                            Tab(
                              text: "Adidas",
                            ),
                            Tab(
                              text: "Rebok",
                            ),

                            Tab(
                              text: "Nike ",
                            ),
                            Tab(
                              text: " Fila",
                            ),
                            Tab(
                              text: " new Balance",
                            ),
                          ]),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.58,
                          width: double.infinity,
                          child: const TabBarView(
                            children: [
                              Skechers(),
                              Puma(),
                              Adidas(),
                               Rebok(),
                               Nike(),
                              Fila(),

                              NewBalance(),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )));
  }
}
