class FoodResponse {
  final String catogeryname;
  List<Food>foods;

  FoodResponse({
    this.catogeryname,
    this.foods
  });

  factory FoodResponse.fromJson(Map<String, dynamic> json) {

    return FoodResponse(
     foods: (json['products'] as List)
          .map((i) => Food.fromJson(i))
          .toList(),
      catogeryname: json['categoryName'],
    );
  }
}
//FoodResponse Food
class Food{
String images;
  int id;
  String name;
  String description;
  int price;
  int rating;
  Shop shop;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Food({
 this.images,
    this.id,
    this.name,
    this.description,
    this.price,
    this.rating,
    this.shop,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
  factory Food.fromJson(Map<String, dynamic> json){
    return Food(
      id: json['id'],
      name: json['productName'],
      images: json['imageurl'],
      price: json['price']

      );
}
}

class Shop {
  String id;
  String name;
  String email;

  Shop({this.id, this.name, this.email});

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );
}

enum FoodTypes {
  
  StreetFood,
  All,
  Coffee,
  Asian,
  Burger,
  Dessert,
}

  