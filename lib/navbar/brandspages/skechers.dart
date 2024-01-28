import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlineshes/variable/DataModel.dart';
import 'package:provider/provider.dart';

import '../../Statemangemant/themeprovider.dart';
import '../../dashbord/details.dart';
import '../../variable/constants.dart';

class Skechers extends StatefulWidget {
  const Skechers({
    super.key,
  });

  @override
  State<Skechers> createState() => _SkechersState();
}

class _SkechersState extends State<Skechers> {
     bool isList = false;

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
                      itemCount: DataModel.skecher.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 250),
                      itemBuilder: (_, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                  () => Details(
                                        datamodel: DataModel.skecher[index],
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
                                            ? const Color.fromARGB(
                                                255, 17, 16, 16)
                                            : Colors.white,
                                        blurRadius: 6,
                                        offset: const Offset(3, 3)),
                                    BoxShadow(
                                        color: themeprovider.darktheme
                                            ? const Color.fromARGB(
                                                255, 24, 24, 24)
                                            : Colors.grey.shade500,
                                        blurRadius: 6,
                                        offset: const Offset(-3, -3)),
                                  ],
                                  borderRadius: BorderRadius.circular(18)),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    DataModel.skecher[index].productImage,
                                    width: 150,
                                    height: 200,
                                  ),
                                  Positioned(
                                    top: 190,
                                    left: 80,
                                    child: Text(
                                      DataModel.skecher[index].productName,
                                      style: TextStyle(
                                        color: themeprovider.darktheme
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 190,
                                      left: 8,
                                      child: Text(
                                          "\$${DataModel.skecher[index].productPrice}",
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
