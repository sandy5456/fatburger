import 'package:fatburger/BLOCS/Cart_Bloc.dart';
import 'package:fatburger/BLOCS/CheckOut_bloc.dart';
import 'package:fatburger/BLOCS/Get_Cart_Bloc.dart';
import 'package:fatburger/MODEL/Get_Cart_Model.dart';
import 'package:fatburger/MODEL/checkOut_model.dart';
import 'package:fatburger/constants/values.dart';
import 'package:fatburger/widgets/Cart_Item_Screen.dart';
import 'package:fatburger/widgets/Confirmation_cart.dart';
import 'package:fatburger/widgets/Delivery_PopUps.dart';
import 'package:fatburger/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConFirmationPage extends StatefulWidget {
  String tableNo;
  String carNo;
  String outsideData;
  String paymentOption;
  ConFirmationPage(
      {this.carNo, this.outsideData, this.tableNo, this.paymentOption});
  @override
  _ConFirmationPageState createState() => _ConFirmationPageState();
}

class _ConFirmationPageState extends State<ConFirmationPage> {
  String phoneNumber;
  CheckOutModel checkOutModel;

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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
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

              //  deliveryConfirmation(context),
              deliveryDetails(context),
              paymetDetails(context),

              confirmationButton(context),
            ],
          ),
        ));
  }

  Widget buildItemsList(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.04,
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

  Widget deliveryDetails(BuildContext context) {
    if (widget.carNo != "null") {
      return Container(
        alignment: Alignment.topRight,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.045,
        child: Row(
          children: <Widget>[
            Text(
              "   will be delivered at carNo",
              style: subtitleStyle,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.26),
            Text("${widget.carNo}",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 15))
          ],
        ),
      );
    }
    if (widget.tableNo != "null") {
      return Container(
        alignment: Alignment.topRight,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.045,
        child: Row(
          children: <Widget>[
            Text(
              "  will be delivered to tableNo",
              style: subtitleStyle,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.24),
            Text("${widget.tableNo}",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 15))
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.topRight,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.06,
        child: Text(
          " Your Order will be delivered to ${widget.outsideData}",
          style: titleStyle2,
        ),
      );
    }
  }

  Widget paymetDetails(BuildContext context) {
    if (widget.paymentOption == "cod") {
      return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.17,
        child: Text(
          "   Amount will be collected at Your Locatiion...",
          style: subtitleStyle,
        ),
      );
    } else {
      return Container(
        alignment: Alignment.topRight,
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          children: <Widget>[
            Text(
              "  Payment method",
              style: subtitleStyle,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.3),
            Text("Online Payment",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 15))
          ],
        ),
      );
    }
  }

  Widget confirmationButton(context) {
    return Center(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
          width: double.infinity, // match_parent
          child: FlatButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () async {
              checkOutModel = new CheckOutModel(
                tableNo: widget.tableNo,
                carNo: widget.carNo,
                outsideData: widget.outsideData,
                paymentOption: widget.paymentOption,
              );
              cheakOutBloc.addPostData(checkOutModel);
                 showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.black,
                              title: new Text("Orderd Placed succefully",style: TextStyle(color:Colors.white,)),
                              //content: new Text("Body"),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text("Go to home",style: TextStyle(color:Colors.green,)),
                                  onPressed: () {
                                     Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>YoutubeMain()));
                                  },
                                )
                              ],
                            );
                          });
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
