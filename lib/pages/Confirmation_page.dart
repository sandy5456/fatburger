import 'package:flutter/material.dart';
import 'package:kyankafe/BLOCS/CheckOut_bloc.dart';
import 'package:kyankafe/BLOCS/Confirm_cart_Bloc.dart';
import 'package:kyankafe/BLOCS/Get_Cart_Bloc.dart';
import 'package:kyankafe/BLOCS/State_Managment.dart';
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';
import 'package:kyankafe/MODEL/checkOut_model.dart';
import 'package:kyankafe/constants/values.dart';
import 'package:kyankafe/widgets/Confirmation_cart.dart';
import 'package:kyankafe/widgets/bottom_navigation.dart';
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
    confirmationCartBloc.fetchAllConfirmCartItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          height: MediaQuery.of(context).size.height * 0.75,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildItemsList(context),
              totalAmount(),
              Divider(),

              //  deliveryConfirmation(context),
              deliveryDetails(context),
              paymetDetails(context),

              confirmationButton(context),
            ],
          ),
        ));
  }

  Widget buildItemsList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
        child: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.04,
      child: StreamBuilder<GetCartModel2>(
          stream: confirmationCartBloc.getAllCartItems,
          builder: (context, AsyncSnapshot<GetCartModel2> snapshot) {
            // if (!["", null].contains(phoneNumber)) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: new BoxDecoration(),
                            child: Card(
                              elevation: 5,
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: size.height * 0.14,
                                    width: size.width * 1,
                                    padding: EdgeInsetsDirectional.only(
                                        start: size.width * 0.01,
                                        end: size.width * 0.01),
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
                                                            snapshot
                                                                .data
                                                                .products[index]
                                                                .productInfo
                                                                .image)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              padding:
                                                  EdgeInsetsDirectional.only(
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
                                                        overflow: TextOverflow
                                                            .visible,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                size.width *
                                                                    0.035),
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
                                                          fontSize: size.width *
                                                              0.032,
                                                          color:
                                                              Colors.black26),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.02,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          bottom: size.height * 0.025,
                                          left: size.width * 0.33,
                                          child: Container(
                                              child: RichText(
                                            text: TextSpan(
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'QAR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 18)),
                                                TextSpan(
                                                    text:
                                                        "${snapshot.data.products[index].productInfo.price}",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.green,
                                                        fontSize: 18)),
                                              ],
                                            ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    );
                  });
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

  Widget totalAmount() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.03,
      child: StreamBuilder<GetCartModel2>(
          stream: confirmationCartBloc.getAllCartItems,
          builder: (context, AsyncSnapshot<GetCartModel2> snapshot) {
            // if (!["", null].contains(phoneNumber)) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount:1,
                  itemBuilder: (BuildContext context, int index) {
                    return    Row(
              children: <Widget>[
                Text(" Amount Payble",style: headerStyle,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: 'QAR ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18)),
                              TextSpan(
                                    text: "${snapshot.data.totalprice}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 18)),
                            ],
                          ),
                        )
              ],
            );
                  });
            }
            else{
              return Container(
                color: Colors.white,
              );
            }
          }),
    );
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
              checkoutData(
                "50372282",
                stateManagmentData.dyning,
                stateManagmentData.options,
              );

              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: new Text("Orderd Placed succefully",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      //content: new Text("Body"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Go to home",
                              style: TextStyle(
                                color: Colors.green,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => YoutubeMain()));
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

  checkoutData(String phone, String dyningnumber, String dyningplace) async {
    await cheakOutBloc.addPostData(phone, dyningnumber, dyningplace);
  }
}
