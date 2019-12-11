import 'package:fatburger/BLOCS/Cart_Bloc.dart';
import 'package:fatburger/BLOCS/Get_Cart_Bloc.dart';
import 'package:fatburger/MODEL/Get_Cart_Model.dart';
import 'package:fatburger/constants/values.dart';
import 'package:fatburger/widgets/Cart_Item_Screen.dart';
import 'package:fatburger/widgets/Confirmation_cart.dart';
import 'package:fatburger/widgets/Delivery_PopUps.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConFirmationPage extends StatefulWidget {
  String tableNo;
  String carNo;
  String outsideData;
  ConFirmationPage({this.carNo, this.outsideData, this.tableNo});
  @override
  _ConFirmationPageState createState() => _ConFirmationPageState();
}

class _ConFirmationPageState extends State<ConFirmationPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.black,
          //   ),
          //   onPressed: () => Navigator.pop(context, false),
          // ),
          elevation: 0.3,
          backgroundColor: Colors.white,
          title: Text(
            "Conformation",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container(
              //   alignment: Alignment.center,
              //   width: double.infinity,
              //   child: Container(
              //     width: 90,
              //     height: 9,
              //     decoration: ShapeDecoration(
              //         shape: StadiumBorder(), color: Colors.black26),
              //   ),
              // ),

              buildItemsList(context),
              Divider(),
              deliveryConfirmation(context),
              Divider(),
              confirmationButton(context),
            ],
          ),
        ));
  }

  Widget buildItemsList(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.05,
      child: StreamBuilder<List<GetCartModel>>(
          stream: getCartBloc.getAllCartItems,
          builder: (context, AsyncSnapshot<List<GetCartModel>> snapshot) {
            // if (!["", null].contains(phoneNumber)) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ConfirmationCartItems(
                          tableNo: widget.tableNo,
                          carNo: widget.carNo,
                          outsideData: widget.outsideData,
                          removeItem: _removeProductFromCart,
                          products: snapshot.data[index].products,
                          phoneNumber: phoneNumber,
                        );
                      }),
                  SizedBox(
                    height: 5,
                  ),
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
          }),
    ));
  }

  Widget deliveryConfirmation(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.342,
      child: Column(
        children: <Widget>[
          Text("Amount Payble"),
          Text("Will be Delivered To...")
        ],
      ),
    );
  }

  Widget confirmationButton(context) {
    return Center(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.071,
          width: double.infinity, // match_parent
          child: FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {
              // navigateToPage(
              //     context,
              //     ConFirmationPage(

              //     ));
            },
            child: Text(
              "CONFIRM",
              style: TextStyle(fontSize: 20.0),
            ),
          )),
    );
  }

  _removeProductFromCart(String productId) async {
    await cartBloc.removeProductFromCart(productId, phoneNumber);
  }
}
