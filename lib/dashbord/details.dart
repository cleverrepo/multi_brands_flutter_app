import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:onlineshes/Statemangemant/stateprovider.dart';
import 'package:onlineshes/Statemangemant/themeprovider.dart';
import 'package:onlineshes/homepage/home.dart';
import 'package:onlineshes/variable/constants.dart';
import 'package:provider/provider.dart';

import '../variable/DataModel.dart';

class Details extends StatefulWidget {
  final DataModel datamodel;

  const Details({
    super.key,
    required this.datamodel,
  });

  @override
  State<Details> createState() => _DetailsState();
}

bool selectedImage = true;

class _DetailsState extends State<Details> {
  late String currentImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentImage = widget.datamodel.productImage;
  }

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    final ratingProvider = Provider.of<ProviderManagement>(context);
    final cartProvider =
        Provider.of<ProviderManagement>(context, listen: false);
    bool inside = cartProvider.isInTheCart(widget.datamodel);
    return Scaffold(
      backgroundColor: themeprovider.darktheme
          ? const Color.fromARGB(255, 24, 24, 24)
          : Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.back(canPop: true, closeOverlays: true);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: themeprovider.darktheme ? Colors.white : Colors.black12,
            ),
          ),
          backgroundColor: themeprovider.darktheme
              ? const Color.fromARGB(255, 24, 24, 24)
              : Colors.white,
          title: Text(
            "Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontsize,
              color: themeprovider.darktheme ? Colors.white : Colors.black,
            ),
          )),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                InteractiveViewer(
                  clipBehavior: Clip.hardEdge,
                  scaleEnabled: true,
                  alignment: Alignment.center,
                  trackpadScrollCausesScale: true,
                  transformationController: TransformationController(),
                  maxScale: 5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentImage =
                            currentImage == widget.datamodel.productImage
                                ? widget.datamodel.subImages[0]
                                : widget.datamodel.productImage;
                      });
                    },
                    child: Image.asset(
                      currentImage,
                      width: 320,
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.datamodel.subImages.length,
                      itemBuilder: (_, int index) {
                        final sub = widget.datamodel.subImages[index];
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                currentImage = sub;
                              });

                            },
                            child: Image.asset(
                              sub,
                              width: 100,
                              height: 60,
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color:
                      themeprovider.darktheme ? Colors.black12 : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft, child: Text("Colors")),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurStyle: BlurStyle.inner,
                                  blurRadius: 6,
                                  spreadRadius: 10,
                                  color: Colors.black,
                                )
                              ],
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurStyle: BlurStyle.inner,
                                  blurRadius: 6,
                                  spreadRadius: 10,
                                  color: Colors.grey,
                                )
                              ],
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurStyle: BlurStyle.inner,
                                  blurRadius: 6,
                                  spreadRadius: 10,
                                  color: Colors.orange,
                                )
                              ],
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    blurStyle: BlurStyle.inner,
                                    blurRadius: 6,
                                    spreadRadius: 10,
                                    color: Colors.brown)
                              ],
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 8),
                      child: Align(
                          alignment: Alignment.topLeft, child: Text("Sizes")),
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text("7.7"),
                          ),
                        ),
                        Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text("7.9"),
                          ),
                        ),
                        Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text("5.8"),
                          ),
                        ),
                        Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                            child: Text("6.5"),
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.datamodel.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontsize,
                            color: themeprovider.darktheme
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: ratingProvider.rating,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: Colors.deepOrange,
                      updateOnDrag: true,
                      minRating: 2,
                      maxRating: 5,
                      itemSize: 20,
                      direction: Axis.horizontal,
                      itemBuilder: (_, int index) {
                        return const Icon(
                          Icons.star,
                          size: 8,
                        );
                      },
                      onRatingUpdate: (rated) {
                        ratingProvider.getRating(rated);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: fontsize,
                          color: themeprovider.darktheme
                              ? Colors.white
                              : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "\$${widget.datamodel.productPrice.toString()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: fontsize,
                            color: constantColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            inside
                                ? Get.snackbar(
                                    "Success", "Item already in the cart ",
                                    snackPosition: SnackPosition.TOP)
                                : Provider.of<ProviderManagement>(context,
                                        listen: false)
                                    .addToCart(widget.datamodel);

                            Get.snackbar("Success", "Item added to the cart",
                                snackPosition: SnackPosition.TOP);
                            Future.delayed(const Duration(seconds: 1), () {
                              Get.to(() => const Home());
                            });
                          },
                          child: Container(
                            width: 120,
                            height: primaryheight,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: const Offset(6, 6),
                                  color: Colors.grey.withOpacity(0.4),
                                ),
                                const BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(-6, -6),
                                  color: Colors.white10,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  fontSize: fontsize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
