
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kyankafe/BLOCS/propertybloc.dart';
import 'package:kyankafe/FOODMENU/ice_cream/soft_drinks.dart';
import 'package:kyankafe/MODEL/foods_response.dart';

import 'ic_ItemCart.dart';




class IceCream extends StatefulWidget {
  var productId;
  @override
  _IceCreamState createState() => _IceCreamState();
}

class _IceCreamState extends State<IceCream> {
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
                      return IcItemCard(
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
                      return SoftDrinksCard(
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
