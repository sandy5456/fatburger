import 'dart:io';

class StateManagmentData{
  String options;
  String dyning;
  String carNumber;
  int quantity;
  int cartQuantity;
  String tableNumber;
  String outsidedata;
  var cartItemLenght;
  var totalAmounttopay;

  File file;
  setImageValue(File file){
    file=file;
  }
  setCartQuanity(int cartQuantity ){
    cartQuantity=cartQuantity;
  }
  setTotalAmounttopay(var value){
    totalAmounttopay=value;
  }
  setCarNumberValue(String value) {
    carNumber= value;
  }
  setQuantityValue(int value){
    quantity=value;
  }
  setTablenumberValue(String value){
    tableNumber=value;
  }
   setoutsideValue(String value){
    outsidedata=value;
  }
setoptionValue(String value){
  options=value;
}
setDyningValue(String value){
  dyning=value;
}
setCartItemValue(var value){
  cartItemLenght=value;
}
}
final stateManagmentData = StateManagmentData();
