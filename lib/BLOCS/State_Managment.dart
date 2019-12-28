class StateManagmentData{
  String options;
  String dyning;
  String carNumber;
  int quantity;
  String tableNumber;
  String outsidedata;
  var cartItemLenght;
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
