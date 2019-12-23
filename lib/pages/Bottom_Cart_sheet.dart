import 'package:fatburger/BLOCS/Cart_Bloc.dart';
import 'package:fatburger/BLOCS/Get_Cart_Bloc.dart';

import 'package:fatburger/MODEL/Get_Cart_Model2.dart';

import 'package:fatburger/PAGES/Cart_Item_Screen1.dart';
import 'package:fatburger/PAGES/Dlivery_Option.dart';
import 'package:fatburger/constants/values.dart';

import 'package:fatburger/widgets/Cart_Item_Screen.dart';
import 'package:fatburger/widgets/Delivery_PopUps.dart';

import 'package:flutter/material.dart';
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
    cartBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    return Expanded(
        child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.65,
      child: StreamBuilder<GetCartModel2>(
          stream: getCartBloc.getAllCartItems,
          builder: (context, AsyncSnapshot<GetCartModel2> snapshot) {
            // if (!["", null].contains(phoneNumber)) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  CartItemList1(
                          removeItem: _removeProductFromCart,
                          products: snapshot.data.products,
                          phoneNumber: phoneNumber,
                        );
                      }),

                  SizedBox(
                    height: 5,
                  ),
                  // CartCheckoutWidget(
                  //   total: snapshot.data.total.toString(),
                  //   shippingCharge: 0.0,
                  // ),
                ],
              );
            } else {
              return Container(
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                )),
              );
            }
            // } else {
            //   return Center(
            //     child: Container(
            //       child: RaisedButton(
            //         child: Text(
            //           "Login",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         color: Colors.pink,
            //         padding: EdgeInsets.only(
            //             left: MediaQuery.of(context).size.width * 0.08,
            //             right: MediaQuery.of(context).size.width * 0.08,
            //             top: MediaQuery.of(context).size.height * 0.025,
            //             bottom:
            //                 MediaQuery.of(context).size.height * 0.025),
            //         shape: new RoundedRectangleBorder(
            //             borderRadius: new BorderRadius.circular(10.0)),
            //         // onPressed: () =>
            //         //     {navigateToPage(context, LoginScreen())},
            //       ),
            //     ),
            //   );
            // }
          }),
    ));
  }

  Widget addToCardButton(context) {
    return Center(
      child: RaisedButton(
        child: Text('CheckOut', style: titleStyle),
        onPressed: () {
          setState(() {
               deliveryOptionPopUpBox(context);
          });
       
        },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: mainColor,
        shape: StadiumBorder(),
      ),
    );
  }

  _removeProductFromCart(String productId) async {
    await cartBloc.removeProductFromCart(productId, phoneNumber);
  }


}
