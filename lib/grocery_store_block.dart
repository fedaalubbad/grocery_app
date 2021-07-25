import 'package:flutter/cupertino.dart';
import 'package:grocery_app/product.dart';
enum GroceryState {
  normal,
  details,
  cart
}
class GroceryStoreBloc with ChangeNotifier{
  GroceryState groceryState=GroceryState.normal;
  List<GroceryProduct>catalog=List.unmodifiable(groceryProduct);
  List<GroceryProductItem>cart=[];
  void changeToNormal(){
  groceryState=GroceryState.normal;
  notifyListeners();
  }
  void changeToCart(){
    groceryState=GroceryState.cart;
    notifyListeners();

  }
  void addProduct(GroceryProduct product){
    cart.add(GroceryProductItem(product: product));
    notifyListeners();

  }
  
}
class GroceryProductItem {
  int quantity;
  final GroceryProduct product;

  GroceryProductItem({ @required this.product,this.quantity = 1,});

  void add(){}
  void substract(){}
}