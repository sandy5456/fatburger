
import 'package:flutter/material.dart';
import 'package:kyankafe/MODEL/foods_response.dart';


class MyCart extends ChangeNotifier {
  List<CartItem> items = [];
  List<CartItem> get cartItems => items;

  bool addItem(CartItem cartItem) {
    for (CartItem cart in cartItems) {
      // if (cartItem.userid != cart.userid) {
      //   return false;
      // }
      if (cartItem.productid == cart.productid) {
        cartItems[cartItems.indexOf(cart)].quantity++;
        notifyListeners();
        return true;
      }
    }

    items.add(cartItem);
    notifyListeners();
    return true;
  }

  void clearCart() {
    items.clear();
    notifyListeners();
  }

  void decreaseItem(CartItem cartModel) {
    if (cartItems[cartItems.indexOf(cartModel)].quantity <= 1) {
      return;
    }
    cartItems[cartItems.indexOf(cartModel)].quantity--;
    notifyListeners();
  }

  void increaseItem(CartItem cartModel) {
    cartItems[cartItems.indexOf(cartModel)].quantity++;
    notifyListeners();
  }

  void removeAllInCart(Food food) {
    cartItems.removeWhere((f) {
      return f.productid == food.id;
    });
    notifyListeners();
  }
}

class CartItem {
Food food;
 int userid;
  int productid;
  int quantity;

  CartItem({ this.food,this.quantity,this.productid,this.userid, int qantity});
}
