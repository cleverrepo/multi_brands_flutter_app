import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onlineshes/Statemangemant/stateprovider.dart';
import 'package:onlineshes/variable/DataModel.dart';
import 'package:provider/provider.dart';

import '../../Statemangemant/themeprovider.dart';
import '../../dashbord/details.dart';
import '../../variable/constants.dart';

class Adidas extends StatefulWidget {
  const Adidas({
    super.key,
  });

  @override
  State<Adidas> createState() => _AdidasState();
}

class _AdidasState extends State<Adidas> {
   bool wishList = true;

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 700,
              width: double.infinity,
              child:
              GridView.builder(
                  itemCount: DataModel.adidas.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 250),
                  itemBuilder: (_, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                              () => Details(
                                    datamodel: DataModel.adidas[index],
                                  ),
                              transition: Transition.circularReveal,
                              duration: const Duration(milliseconds: 500));
                        },
                        child: Container(
                          width: 150,
                          height: 290,
                          decoration: BoxDecoration(
                              color: themeprovider.darktheme
                                  ? const Color.fromARGB(255, 24, 24, 24)
                                  : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: themeprovider.darktheme
                                        ? const Color.fromARGB(255, 17, 16, 16)
                                        : Colors.white,
                                    blurRadius: 6,
                                    offset: const Offset(3, 3)),
                                BoxShadow(
                                    color: themeprovider.darktheme
                                        ? const Color.fromARGB(255, 24, 24, 24)
                                        : Colors.grey.shade500,
                                    blurRadius: 6,
                                    offset: const Offset(-3, -3)),
                              ],
                              borderRadius: BorderRadius.circular(18)),
                          child: Stack(
                            children: [
                              Image.asset(DataModel.adidas[index].productImage, width: 150,
                                height: 200,),

                              Positioned(
                                top: 180,
                                left: 80,
                                child: Text(
                                  DataModel.adidas[index].productName,
                                  style: TextStyle(
                                    color: themeprovider.darktheme
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 180,
                                  left: 10,
                                  child: Text(
                                      "\$${DataModel.adidas[index].productPrice}",
                                      style: TextStyle(
                                        fontSize: fontsize,
                                        fontWeight: fontWeight,
                                        color: themeprovider.darktheme
                                            ? Colors.white
                                            : Colors.black,
                                      ))),

                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
