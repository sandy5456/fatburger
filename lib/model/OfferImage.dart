
class OfferImageModel {
  final String catogeryname;
  List<Products>products;

  OfferImageModel({
    this.catogeryname,
    this.products
  });

  factory OfferImageModel.fromJson(Map<String, dynamic> json) {

    return OfferImageModel(
     products: (json['products'] as List)
          .map((i) => Products.fromJson(i))
          .toList(),
      catogeryname: json['categoryName'],
    );
  }
}
class Products{
  String name;
  String image;
  Products({this.name,
  this.image,
  });
  factory Products.fromJson(Map<String, dynamic> json){
    return Products(
      name: json['productName'],
      image: json['imageurl'],

      );
}
}