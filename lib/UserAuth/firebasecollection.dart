import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:onlineshes/homepage/home.dart';
import 'package:onlineshes/variable/DataModel.dart';

class FirebaseCollection {
  static  Future<void> addToFirebase(DataModel product)async {
    CollectionReference colletionReference = FirebaseFirestore.instance
        .collection("orders");
    DocumentReference documentReference = colletionReference.doc();


    try {
      await FirebaseFirestore.instance.collection("order").add({
        "name": product.productName,
        "price": product.productPrice,
        "image": product.productImage,
        "quantity": product.quantity
      }).whenComplete(() =>
          Get.snackbar(
              "Success", "order sent successfully ",snackPosition: SnackPosition.BOTTOM)).then((value) =>
          Get.to(() => const Home()));
    } catch (error) {
      Get.snackbar(
          "Success",snackPosition: SnackPosition.BOTTOM, "${error.toString()} ");
    }
  }}
