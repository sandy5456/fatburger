import 'package:fatburger/BLOCS/Cart_Bloc.dart';
import 'package:fatburger/BLOCS/Get_Cart_Bloc.dart';
import 'package:fatburger/PAGES/Cart_Item_Screen1.dart';

import 'package:fatburger/blocs/offer_images_bolc.dart';
import 'package:fatburger/blocs/propertybloc.dart';
import 'package:fatburger/constants/values.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:fatburger/notifier/cart_model.dart';
import 'package:fatburger/widgets/Cart_Item_Screen.dart';
import 'package:fatburger/widgets/cart_bottom_sheet.dart';
import 'package:fatburger/widgets/static_food_menu/increment_and_dicriment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';

class Soups extends StatefulWidget {
  List<Food> foods;
  String name;
  String productId = "12";
  String phoneNumber = "50372282";
  String quantity = "2";
  Soups({this.foods, this.name});
  @override
  _SoupsState createState() => _SoupsState();
}

class _SoupsState extends State<Soups> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.foods.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                InkWell(
                  onTap: () async => {alertBox(context, index)},
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.25,
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: Colors.white,
                    child: Card(
                      color: Colors.transparent,
                      child: Container(
                        //image
                        // width: MediaQuery.of(context).size.height * 0.4,
                        // height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: new NetworkImage("http://142.93.219.45:8080/filemanager/"+widget.foods[index].images),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          color: Colors.white,
                        ),

                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: <Widget>[
                            Container(
                              //name
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,

                              height: MediaQuery.of(context).size.height * 0.07,
                              child: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(
                                            "   ${widget.foods[index].name}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.13,
                                        ),
                                        Text(
                                          "QAR:${widget.foods[index].price}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        // Image.asset("assets/loc.png",height: 20,),
                                        RatingBar(
                                          initialRating: 5.0,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemSize: 14,
                                          unratedColor: Colors.white,
                                          itemPadding:
                                              EdgeInsets.only(right: 4.0),
                                          ignoreGestures: true,
                                          itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.yellow),
                                          onRatingUpdate: (rating) {},
                                        ),
                                        Card(
                                          margin: EdgeInsets.only(left: 65),
                                          color: Colors.green,
                                          child: InkWell(
                                              //onTap: addItemToCard,
                                              splashColor: Colors.white70,
                                              child: Icon(
                                                Icons.add,
                                                size: 16,
                                                color: Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
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
  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartItemList1(),
    );
  }

  addingtoCart() async {
    await getCartBloc.additemsToCart(
        widget.productId, widget.quantity);
  }

  alertBox(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)), //this right here
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        image: new DecorationImage(
                          image: new NetworkImage(
                              "http://142.93.219.45:8080/filemanager/"+widget.foods[index].images), //Image
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          //Name contanier
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.height * 0.04,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "   ${widget.foods[index].name}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                      RatingBar(
                                          initialRating: 5.0,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemSize: 14,
                                          unratedColor: Colors.white,
                                          itemPadding:
                                              EdgeInsets.only(right: 2.0),
                                          ignoreGestures: true,
                                          itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.yellow),
                                          onRatingUpdate: (rating) {},
                                        ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.10,
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.015),
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              RichText(
                                
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      
                                        text: 'QAR',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 18)),
                                    TextSpan(
                                        text: ":${widget.foods[index].price}",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 18)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        Container(
                            //sq
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01),
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width * 0.30,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: PluseAndMinus()),
                      ],
                    ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0132,
                        ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity, // match_parent
                        child: FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              //addingtoCart();
                            });
                          },
                          child: Text(
                            "CONFIRM",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ))
                  ],
                ),
              ));
        });
  }
}
