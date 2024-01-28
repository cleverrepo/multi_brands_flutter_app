import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Statemangemant/stateprovider.dart';
import '../variable/DataModel.dart';
import '../variable/constants.dart';

class Order extends StatefulWidget {
  const Order({super.key, required this.totalPrice, required this.dataModel, required this.quantity});
  final double totalPrice;
  final DataModel dataModel;
  final int quantity;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
     final orderDataProvider = Provider.of<ProviderManagement>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: orderDataProvider.cartItem
                  .length, // Since you're displaying a single item, set itemCount to 1
              itemBuilder: (_, int index) {
                return Padding(
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
                          offset: const Offset(3, 3),
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          blurRadius: 6,
                          offset: Offset(-3, -3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                          image: AssetImage(widget.dataModel.productImage),
                          width: 130,
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.dataModel.productName,
                              style: const TextStyle(
                                fontSize: fontsize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              widget.dataModel.productPrice.toString(),
                            ),
                            Text(
                              widget.totalPrice.toString(),
                              style: const TextStyle(
                                fontSize: fontsize,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
