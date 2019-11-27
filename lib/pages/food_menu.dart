
import 'package:fatburger/widgets/food_card.dart';
import 'package:flutter/material.dart';


class Drinks extends StatefulWidget {
  @override
  _DrinksState createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  @override
  Widget build(BuildContext context) {
    return Container(
  
       height: MediaQuery.of(context).size.height * 0.2,
      child:  FoodCard()
    );
  }
}


class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height *  0.2,
      child: FoodCard()
    );
  }
}


class Icecream extends StatefulWidget {
  @override
  _IcecreamState createState() => _IcecreamState();
}

class _IcecreamState extends State<Icecream> {
  @override
  Widget build(BuildContext context) {
    return Container(
           height: MediaQuery.of(context).size.height *  0.2,
      child: FoodCard()
    );
  }
}

class Burger extends StatefulWidget {
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  Widget build(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height *  0.2,
      child: FoodCard()
    );
  }
}