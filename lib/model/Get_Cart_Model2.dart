class GetCartModel2 {
  final String catogeryname;
  final double totalprice;
  final double subtotal;
  List<CartProducts2> products;
  List<CustomerInfo> customerinfo;

  GetCartModel2(
      {this.catogeryname,
      this.products,
      this.totalprice,
      this.subtotal,
      this.customerinfo});

  factory GetCartModel2.fromJson(Map<String, dynamic> json) {
    var list = json['cartItem'] as List;
    print("Cart item" + list.toString());

    List<CartProducts2> cartproducts =
        list.map((i) => CartProducts2.fromJson(i)).toList();

    print("size" + cartproducts.length.toString());
    return GetCartModel2(
      products: cartproducts,
      totalprice: double.parse(json['totalPrice'].toString()),
      subtotal: double.parse(json['subTotal'].toString()),
//      customerinfo: (json['customerInfo'] as List)
//          .map((i) => CustomerInfo.fromJson(i))
//          .toList(),
    );
  }
 
}

class CartProducts2 {
  ProductInfo productInfo;
  final int quantity;
  final double subtotal;

  CartProducts2({this.quantity, this.subtotal, this.productInfo});
  factory CartProducts2.fromJson(Map<String, dynamic> json) {
    print("IN product" + json["productInfo"].toString());
//    var list = json['productInfo'] as List;
    var p = ProductInfo.fromJson(json['productInfo']);
//     print("HERE");
    print("adfasd" + p.name);
//    List<ProductInfo> cartproducts =
//        list.map((i) => ProductInfo.fromJson(i)).toList();
    return CartProducts2(
        productInfo: ProductInfo.fromJson(json['productInfo']),
        quantity: json['quantity'],
        subtotal: json['subTotal']);
  }
   Map toMap(){
    var map=new Map<String,dynamic>();
    map['quantity']=quantity;

  }
}

class ProductInfo {
  String name;
  String image;
  int price;
  int offer;
  String productId;
  int catogeryId;
  ProductInfo(
      {this.image,
      this.price,
      this.offer,
      this.productId,
      this.catogeryId,
      this.name});
  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    print("prodjcut" + json['price'].toString());
    return ProductInfo(
      productId: json['productCode'],
        name: json['productName'],
        image: json['imageurl'],
        price: double.parse(json['price'].toString()).toInt(),
        catogeryId: int.parse(json['categoryId'].toString()),
        offer: int.parse(json['offer'].toString()));
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map['productCode']=productId;
    }
}

class CustomerInfo {
  String phone;
  String name;
  CustomerInfo({this.name, this.phone});
  factory CustomerInfo.fromJson(Map<String, dynamic> json) {
    return CustomerInfo(name: json['mode'], phone: json['phone']);
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map['phone']=phone;
    }
}
