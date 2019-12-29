

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kyankafe/BLOCS/propertybloc.dart';
import 'package:kyankafe/FOODMENU/breakfast/breakfat_itemCard.dart';
import 'package:kyankafe/FOODMENU/breakfast/salad_card.dart';
import 'package:kyankafe/MODEL/foods_response.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';



class Breakfast extends StatefulWidget {
  var productId;
  @override
  _BreakfastState createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
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
                      return BreakFastItemCard(
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
                      return SaladCard(
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
