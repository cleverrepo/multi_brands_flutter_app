class FirebaseCollection {
  // static Future<void> addToFirebase(DataModel product) async {
  //   FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
  //   CollectionReference collectionReference = FirebaseFirestore.instance.collection("store");
  //
  //   try {
  //     await collectionReference.doc(firebaseAuth.currentUser?.email.toString()).collection("store").add({
  //       "name": product.productName,
  //       "price": product.productPrice,
  //       "image": product.productImage,
  //       "quantity": product.quantity ?? 1, // Assuming quantity is part of DataModel
  //       // Add any other fields you want to store in the order
  //     }).then((value) =>
  //         Get.snackbar(
  //             "Success", "Order sent successfully", snackPosition: SnackPosition.BOTTOM)).then((value) =>
  //         Get.to(() => const Home()));
  //   } catch (error) {
  //     Get.snackbar(
  //         "Error", "${error.toString()}", snackPosition: SnackPosition.BOTTOM);
  //   }
  // }
}
