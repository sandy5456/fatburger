class GetFavModel {
  final String productname;
  final int pId;
  String image;
  double price;
  int id;

  GetFavModel({this.productname, this.id, this.image, this.price, this.pId});

  factory GetFavModel.fromJson(Map<String, dynamic> json) {
    return GetFavModel(
      productname: json['productName'],
      pId: json['productId'],
      price: json['price'],
      image: json['imageurl'],
      id: json['id'],
    );
  }
}
