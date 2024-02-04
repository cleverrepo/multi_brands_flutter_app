import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:onlineshes/UserAuth/firebasecollection.dart';
import 'package:onlineshes/homepage/home.dart';

import 'package:onlineshes/variable/DataModel.dart';
import 'package:provider/provider.dart';

import '../Statemangemant/stateprovider.dart';
import '../Statemangemant/themeprovider.dart';
import '../variable/constants.dart';

class Cart extends StatefulWidget {


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<DataModel> cartModel = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderManagement>(context);
    final themeprovider = Provider.of<ThemeProvider>(context);
    double totalPrice = Provider.of<ProviderManagement>(context).getTotal();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("store");

    return Scaffold(
      backgroundColor: themeprovider.darktheme
          ? const Color.fromARGB(255, 24, 24, 24)
          : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: provider.cartItem.isEmpty
          ? Column(
              children: [
                const Image(image: AssetImage("Assets/images/basket.png")),
                Text(
                  "oops, your basket it empty ",
                  style: TextStyle(
                    fontSize: fontsize,
                    color:
                        themeprovider.darktheme ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Consumer<ProviderManagement>(
                    builder: (context, value, child) {
                      return ListView.builder(
                          itemCount: provider.cartItem.length,
                          itemBuilder: (_, int index) {
                            return Dismissible(
                              onDismissed: (direction) {
                                Provider.of<ProviderManagement>(context,
                                        listen: false)
                                    .removeItem(index);
                              },
                              key: ValueKey(value.cartItem[index]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade500,
                                            blurRadius: 6,
                                            offset: const Offset(3, 3)),
                                        const BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 6,
                                            offset: Offset(-3, -3)),
                                      ],
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            value.cartItem[index].productImage),
                                        width: 130,
                                        fit: BoxFit.cover,
                                        height: 120,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            value.cartItem[index].productName,
                                            style: const TextStyle(
                                              fontSize: fontsize,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(value
                                              .cartItem[index].productPrice
                                              .toString()),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              value.decreaseQuantity(index);
                                            },
                                            child: Container(
                                              width: secondaryWidth,
                                              height: secondaryHeight,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    offset: const Offset(6, 6),
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
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
                                                  "-",
                                                  style: TextStyle(
                                                    fontSize: fontsize,
                                                    fontWeight: fontWeight,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Consumer<ProviderManagement>(
                                            builder: (BuildContext context,
                                                provided, child) {
                                              return Text(
                                                " ${value.cartItem[index].quantity}",
                                                style: const TextStyle(
                                                  fontWeight: fontWeight,
                                                  fontSize: fontsize,
                                                ),
                                              );
                                            },
                                          ),
                                          InkWell(
                                            onTap: () {
                                              value.increaseQuantity(index);
                                            },
                                            child: Container(
                                              width: secondaryWidth,
                                              height: secondaryHeight,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 10,
                                                    offset: const Offset(6, 6),
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
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
                                                  "+",
                                                  style: TextStyle(
                                                    fontSize: fontsize,
                                                    fontWeight: fontWeight,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.purple.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total"),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                barrierColor: Colors.white10,
                                context: (context),
                                builder: (_) {
                                  return AlertDialog.adaptive(
                                    elevation: 20,
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("cancel")),
                                      TextButton(
                                          onPressed: () {
                                            Provider.of<ProviderManagement>(
                                                    context,
                                                    listen: false)
                                                .cleaCart();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Home()));
                                          },
                                          child: const Text("done")),
                                    ],
                                    scrollable: true,
                                    title: const Text(" card information"),
                                    content: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Enter you card information",
                                            style:
                                                TextStyle(fontSize: fontsize),
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                                hintText: "Holder's Name",
                                                border: UnderlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15))),
                                          ),
                                          const Gap(10),
                                          TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: "Card Number",
                                              border: UnderlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          ),
                                          const Gap(10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                                width: 80,
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Exp Date",
                                                    border: UnderlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                  ),
                                                ),
                                              ),
                                              const Gap(10),
                                              SizedBox(
                                                height: 50,
                                                width: 80,
                                                child: TextField(
                                                  undoController:
                                                      UndoHistoryController(),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "CV",
                                                    border:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Gap(10),
                                          ElevatedButton(
                                            onPressed: () async {
  },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.deepPurple,
                                                elevation: 20),
                                            child: const Text(
                                              "Pay Now",
                                              style:
                                                  TextStyle(fontSize: fontsize),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    actionsAlignment: MainAxisAlignment.center,
                                  );
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(18)),
                            width: 160,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("Check out"),
                                Center(
                                  child: Text(
                                    totalPrice.toStringAsFixed(2),
                                    style: const TextStyle(fontSize: fontsize),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
    );
  }
}
