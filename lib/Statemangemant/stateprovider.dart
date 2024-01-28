
import 'package:flutter/cupertino.dart';

import '../variable/DataModel.dart';

class ProviderManagement extends ChangeNotifier{
  int x=0;
  int get _x=>x;
double rate=0;
double get rating=>rate;
void getRating(double newRate){
  rate=newRate;
  notifyListeners();
}
  void increaseQuantity(int index) {
    if (index >= 0 && index < cartItem.length) {
      if (cartItem[index].quantity < 6) {
        cartItem[index].quantity++;
        notifyListeners();
      }
    }
  }

  void decreaseQuantity(int index) {
    if (index >= 0 && index < cartItem.length && cartItem[index].quantity > 0) {
      cartItem[index].quantity--;
      notifyListeners();
    }

  }


  List<DataModel>cartItem=[];

  List<DataModel> get cart => cartItem;
  void cleaCart(){
cartItem.clear();
notifyListeners();
  }
  void addToCart(DataModel dataModel) async {
    cartItem.add(dataModel);
    notifyListeners();
  }
  void removeItem(int item){
    cartItem.remove(cartItem.elementAt(item));
    notifyListeners();
  }


bool isInTheCart(DataModel dom){
    return cartItem.contains(dom);
}
  double getTotal(){
    return cartItem.fold(0.0, (total, items) =>total+items.productPrice * items.quantity);
  }
void sentToDatabase(DataModel datmodel){
    cartItem.add(datmodel);
    notifyListeners();
}
  void setOrderData({required double totalPrice, required DataModel product}) {
    this.totalPrice = totalPrice;
    this.product = product;
    notifyListeners();
  }
  DataModel getItemAtIndex(int index) {
    return cartItem[index];
  }
  double totalPrice = 0;
  late DataModel product ;
}

