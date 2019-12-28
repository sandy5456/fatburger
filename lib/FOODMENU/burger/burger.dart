import 'package:fatburger/BLOCS/Cart_Bloc.dart';
import 'package:fatburger/BLOCS/Get_Cart_Bloc.dart';
import 'package:fatburger/FOODMENU/burger/burger2.dart';
import 'package:fatburger/FOODMENU/burger/burgerItemCard.dart';
import 'package:fatburger/FOODMENU/ice_cream/ic_ItemCart.dart';
import 'package:fatburger/FOODMENU/ice_cream/soft_drinks.dart';
import 'package:fatburger/FOODMENU/soup_items_card.dart';
import 'package:fatburger/PAGES/Cart_Item_Screen1.dart';

import 'package:fatburger/blocs/offer_images_bolc.dart';
import 'package:fatburger/blocs/propertybloc.dart';
import 'package:fatburger/constants/values.dart';

import 'package:fatburger/model/foods_response.dart';
import 'package:fatburger/notifier/cart_model.dart';
import 'package:fatburger/widgets/Cart_Item_Screen.dart';
import 'package:fatburger/widgets/cart_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';



class Burger extends StatefulWidget {
  var productId;
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
    void initState() {
    // TODO: implement initState
    super.initState();
    propertyBloc.fetchAllCategory();
 
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.25,
          child: StreamBuilder<List<FoodResponse>>(
              stream: propertyBloc.allCategory,
              builder: (context, AsyncSnapshot<List<FoodResponse>> snapshot) {
                if (snapshot.hasData) {
                  //List<Aminety>aminities=snapshot.data[0].aminety;
                  // aMINITES=snapshot.data[10].aminety;
                  // iMAGES=snapshot.data[0].image;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BgItemCard(
                        cId: snapshot.data[index].cId,
                         name: snapshot.data[index].catogeryname,
                        foods: snapshot.data[index].foods,
                      );
                    },
                  );
                } else {
                  return Center(
                    child: SpinKitWave(
                      color: Colors.black45,
                      size: 25.0,
                    ),
                  );
                }
              }),
        ),
                Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.25,
          child: StreamBuilder<List<FoodResponse>>(
              stream: propertyBloc.allCategory,
              builder: (context, AsyncSnapshot<List<FoodResponse>> snapshot) {
                if (snapshot.hasData) {
                  //List<Aminety>aminities=snapshot.data[0].aminety;
                  // aMINITES=snapshot.data[10].aminety;
                  // iMAGES=snapshot.data[0].image;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Bg2ItemCard(
                        cId: snapshot.data[index].cId,
                         name: snapshot.data[index].catogeryname,
                        foods: snapshot.data[index].foods,
                      );
                    },
                  );
                } else {
                  return Center(
                    child: SpinKitWave(
                      color: Colors.black45,
                      size: 25.0,
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }

  //   addItemToCard() {
  //   bool isAddSuccess = Provider.of<MyCart>(context).addItem(CartItem(
  //     food:Food(), quantity: 1));

  //   if (isAddSuccess) {
  //     final snackBar = SnackBar(
  //       content:
  //       //Text("burger add to cart"),
  //        Text('${"widget.foods[index].name"} added to cart'),
  //       action: SnackBarAction(
  //         label: 'view',
  //         onPressed: showCart,
  //       ),
  //       duration: Duration(milliseconds: 1500),
  //     );
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   } else {
  //     final snackBar = SnackBar(
  //       content: Text('You can\'t order from multiple shop at the same time'),
  //       duration: Duration(milliseconds: 1500),
  //     );
  //     Scaffold.of(context).showSnackBar(snackBar);
  //   }
  // }

}
