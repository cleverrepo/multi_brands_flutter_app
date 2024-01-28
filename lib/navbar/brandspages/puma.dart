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

class Puma extends StatefulWidget {
  const Puma({
    super.key,
  });

  @override
  State<Puma> createState() => _PumaState();
}

class _PumaState extends State<Puma> {
  final bool wishList = true;
bool list=false;
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
                  itemCount: DataModel.puma.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 250),
                  itemBuilder: (_, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                                  () => Details(
                                datamodel: DataModel.puma[index],
                              ),
                              transition: Transition.circularReveal,
                              duration: const Duration(milliseconds: 500));
                        },
                        child: Container(
                          width: 100,
                          height: 400,
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
                              Image.asset(DataModel.puma[index].productImage, width: 150,
                                height: 200,),

                              Positioned(
                                top: 180,
                                left: 80,
                                child: Text(
                                  DataModel.puma[index].productName,
                                  style: TextStyle(
                                    color: themeprovider.darktheme
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 180,
                                  left: 8,
                                  child: Text(
                                      "\$${DataModel.puma[index].productPrice}",
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
