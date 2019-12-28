class OfferProductModel {
  final String catogeryname;
  List<OfferProducts>products;

  OfferProductModel({
    this.catogeryname,
    this.products
  });

  factory OfferProductModel.fromJson(Map<String, dynamic> json) {

    return OfferProductModel(
     products: (json['products'] as List)
          .map((i) => OfferProducts.fromJson(i))
          .toList(),
      catogeryname: json['categoryName'],
    );
  }
}
class OfferProducts{
  String name;
  String image;
  int price;
  int offer;
  
  OfferProducts({this.name,
  this.image,
  this.price,
  this.offer,
  });
  factory OfferProducts.fromJson(Map<String, dynamic> json){
    return OfferProducts(
      name: json['productName'],
      image: json['imageurl'],
      price:json['price'],
      offer: json['offer'],


      );
}
}

