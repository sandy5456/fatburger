class GetCartModel {
  final String catogeryname;
  List<CartProducts>products;

  GetCartModel({
    this.catogeryname,
    this.products
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) {

    return GetCartModel(
     products: (json['products'] as List)
          .map((i) => CartProducts.fromJson(i))
          .toList(),
      catogeryname: json['categoryName'],
    );
  }
}
class CartProducts{
  String name;
  String image;
  int price;
  int offer;
  int productId;
  
  CartProducts({this.name,
  this.image,
  this.price,
  this.offer,
  this.productId,
  });
  factory CartProducts.fromJson(Map<String, dynamic> json){
    return CartProducts(
      name: json['productName'],
      image: json['imageurl'],
      price:json['price'],
      offer: json['offer'],
      productId: json['productId'],


      );
}
}