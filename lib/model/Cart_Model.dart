class CartModel {
  List<Product> products;
  int total;

  CartModel({this.products, this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    var list = json['cartItem'] as List;
    List<Product> products = list.map((i) => Product.fromJson(i)).toList();

    return CartModel(
      products: products,
      total: json['total'],
    );
  }
}

class Product {
  String productName;
  String price;
  String productImage;
  String productId;

  Product({
    this.productName,
    this.price,
    this.productImage,
    this.productId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['name'],
      price: json['price'],
      productImage: json['image'],
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': productName,
      'price': price,
      'image': productImage,
      'product_id': productId,
    };
  }
}
