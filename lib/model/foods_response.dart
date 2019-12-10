class FoodResponse {
  int status;
  String message;
  List<Food> foods;

  FoodResponse({this.status, this.message, this.foods});

  factory FoodResponse.fromJson(Map<String, dynamic> json) => FoodResponse(
        status: json["status"],
        message: json["message"],
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      );
}

class Food {
  List<String> images;
  String id;
  String name;
  String description;
  double price;
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

      );
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
