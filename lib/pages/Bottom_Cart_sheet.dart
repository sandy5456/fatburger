import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kyankafe/BLOCS/Get_Cart_Bloc.dart';
import 'package:kyankafe/BLOCS/State_Managment.dart';
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';

import 'package:kyankafe/constants/values.dart';
import 'package:kyankafe/widgets/Delivery_PopUps.dart';
import 'package:kyankafe/widgets/QuantityIncreament.dart';
import 'package:kyankafe/widgets/cart_increment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBottomSheet extends StatefulWidget {
  CartBottomSheet({
    Key key,
  }) : super(key: key);
  @override
  _CartBottomSheetState createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  final promoController = new TextEditingController();

  static String total = "0.0";
  String phoneNumber;

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString("50372282");
  }

  // void initState() {
  //   super.initState();
  //   phoneNumber = "";
  //   getSharedPrefs().then((_) {
  //     if (phoneNumber == null || phoneNumber == "") {
  //     } else {
  //       cartBloc.fetchCartItems(phoneNumber);
  //     }
  //   });
  // }
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartBloc.fetchAllGetCartItem();
  }

  @override
  void dispose() {
    getCartBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Container(
              width: 90,
              height: 8,
              decoration: ShapeDecoration(
                  shape: StadiumBorder(), color: Colors.black26),
            ),
          ),
          buildTitle(),
          Divider(),
          buildItemsList(context),
          Divider(),
          addToCardButton(context),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Your Order', style: headerStyle),
      ],
    );
  }

  Widget buildItemsList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
        child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.50,
      child: StreamBuilder<GetCartModel2>(
          stream: getCartBloc.getAllCartItems,
          builder: (context, AsyncSnapshot<GetCartModel2> snapshot) {
            // if (!["", null].contains(phoneNumber)) {
            if (snapshot.hasData) {
              print(snapshot.data.products.length);

              return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.products.length,
                  itemBuilder: (BuildContext context, int index) {
                       stateManagmentData
                  .setCartItemValue(snapshot.data.products.length);
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: Container(
                        height: size.height * 0.14,
                        width: size.width * 1,
                        padding: EdgeInsetsDirectional.only(
                            start: size.width * 0.01, end: size.width * 0.01),
                        child: Stack(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            "http://142.93.219.45/upload/" +
                                                snapshot.data.products[index]
                                                    .productInfo.image)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  padding: EdgeInsetsDirectional.only(
                                      start: size.width * 0.05),
                                  height: size.height * 0.17,
                                  width: size.width * 0.30,
                                ),
                                Container(
                                  width: size.width * 0.4,
                                  padding: EdgeInsets.only(
                                      top: size.height * 0.02,
                                      left: size.width * 0.03),
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Flexible(
                                          child: Text(
                                            "${snapshot.data.products[index].productInfo.name}",
                                            overflow: TextOverflow.visible,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.035),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Container(
                                        child: Text(
                                          "best selling",
                                          style: TextStyle(
                                              fontSize: size.width * 0.032,
                                              color: Colors.black26),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: size.height * 0.020,
                              right: size.width * 0.05,
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                          fontSize: size.width * 0.032),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: size.height * 0.025,
                              left: size.width * 0.33,
                              child: Container(
                                  child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'QAR',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18)),
                                    TextSpan(
                                        text:
                                            "${snapshot.data.products[index].productInfo.price}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.green,
                                            fontSize: 18)),
                                  ],
                                ),
                              )),
                            ),
                            Positioned(
                              bottom: size.height * 0.022,
                              left: size.width * 0.63,
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.22,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  child: CartQuaintityIncreament(
                                    count:
                                        snapshot.data.products[index].quantity,
                                        productId: snapshot.data.products[index].productInfo,
                                  )),
                            ),
                            Positioned(
                              top: size.height * 0.040,
                              right: size.width * 0.00,
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: FlatButton.icon(
                                    onPressed: () async => {
                                      await _removeProductFromCart(snapshot
                                          .data
                                          .products[index]
                                          .productInfo
                                          .productId)
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "Remove",
                                      style: TextStyle(color: Colors.red[100]),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                    child: SpinKitWave(
                      color: Colors.black45,
                      size: 25.0,
                    ),
                  );
            }
          }),
    ));
  }

  Widget addToCardButton(context) {
    return Center(
      child: StreamBuilder<GetCartModel2>(
          stream: getCartBloc.getAllCartItems,
          builder: (context, AsyncSnapshot<GetCartModel2> snapshot) {
            // if (!["", null].contains(phoneNumber)) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    // stateManagmentData.setCartQuanity(snapshot.data.products[index].quantity);
                    return Center(
                      child: RaisedButton(
                        child: Text('CheckOut', style: titleStyle),
                        onPressed: () {
                          setState(() {
                            deliveryOptionPopUpBox(context);
                          });
                        },
                        padding:
                            EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                        color: mainColor,
                        shape: StadiumBorder(),
                      ),
                    );
                  });
            } else {
              return Container(
                child: RaisedButton(
                        child: Text('CheckOut', style: titleStyle),
                        onPressed: () {
                         
                        },
                        padding:
                            EdgeInsets.symmetric(horizontal: 64, vertical: 12),
                        color: mainColor,
                        shape: StadiumBorder(),
                      ),
              );
            }
          }),
    );
  }

  _removeProductFromCart(int productId) async {
    await getCartBloc.removeToCart(productId);
  }
}
