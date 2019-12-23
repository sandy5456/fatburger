// class GetCartModel2 {
//   int orderNumber;
//   List<CartItem> cartItem;
//   double subTotal;
//   double totalPrice;
//   CustomerInfo customerInfo;
//   bool empty;

//   GetCartModel2(
//       {this.orderNumber,
//       this.cartItem,
//       this.subTotal,
//       this.totalPrice,
//       this.customerInfo,
//       this.empty});

//   GetCartModel2.fromJson(Map<String, dynamic> json) {
//     orderNumber = json['orderNumber'];
//     if (json['cartItem'] != null) {
//       cartItem = new List<CartItem>();
//       json['cartItem'].forEach((v) {
//         cartItem.add(new CartItem.fromJson(v));
//       });
//     }
//     subTotal = json['subTotal'];
//     totalPrice = json['totalPrice'];
//     customerInfo = json['customerInfo'] != null
//         ? new CustomerInfo.fromJson(json['customerInfo'])
//         : null;
//     empty = json['empty'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['orderNumber'] = this.orderNumber;
//     if (this.cartItem != null) {
//       data['cartItem'] = this.cartItem.map((v) => v.toJson()).toList();
//     }
//     data['subTotal'] = this.subTotal;
//     data['totalPrice'] = this.totalPrice;
//     if (this.customerInfo != null) {
//       data['customerInfo'] = this.customerInfo.toJson();
//     }
//     data['empty'] = this.empty;
//     return data;
//   }
// }

// class CartItem {
//   ProductInfo productInfo;
//   int quantity;
//   double subTotal;
//   double deduction;

//   CartItem({this.productInfo, this.quantity, this.subTotal, this.deduction});

//   CartItem.fromJson(Map<String, dynamic> json) {
//     productInfo = json['productInfo'] != null
//         ? new ProductInfo.fromJson(json['productInfo'])
//         : null;
//     quantity = json['quantity'];
//     subTotal = json['subTotal'];
//     deduction = json['deduction'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.productInfo != null) {
//       data['productInfo'] = this.productInfo.toJson();
//     }
//     data['quantity'] = this.quantity;
//     data['subTotal'] = this.subTotal;
//     data['deduction'] = this.deduction;
//     return data;
//   }
// }

// class ProductInfo {
//   String productCode;
//   String productName;
//   int price;
//   int offer;
//   String imageurl;
//   int categoryId;

//   ProductInfo(
//       {this.productCode,
//       this.productName,
//       this.price,
//       this.offer,
//       this.imageurl,
//       this.categoryId});

//   ProductInfo.fromJson(Map<String, dynamic> json) {
//     productCode = json['productCode'];
//     productName = json['productName'];
//     price = json['price'];
//     offer = json['offer'];
//     imageurl = json['imageurl'];
//     categoryId = json['categoryId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['productCode'] = this.productCode;
//     data['productName'] = this.productName;
//     data['price'] = this.price;
//     data['offer'] = this.offer;
//     data['imageurl'] = this.imageurl;
//     data['categoryId'] = this.categoryId;
//     return data;
//   }
// }

// class CustomerInfo {
//   String mode;
//   String phone;

//   CustomerInfo({this.mode, this.phone});

//   CustomerInfo.fromJson(Map<String, dynamic> json) {
//     mode = json['mode'];
//     phone = json['phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['mode'] = this.mode;
//     data['phone'] = this.phone;
//     return data;
//   }
// }
