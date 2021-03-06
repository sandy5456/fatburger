import 'package:flutter/material.dart';
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';
import 'package:kyankafe/widgets/QuantityIncreament.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CartItemList1 extends StatelessWidget {
  String phoneNumber;
  final String catogeryname;
  final double totalprice;
  final double subtotal;
  List<CartProducts2> products;
  List<CustomerInfo> customerinfo;

  final Function removeItem;

  CartItemList1({
    Key key,
    this.subtotal,
    this.customerinfo,
    this.phoneNumber,
    this.products,
    this.removeItem,
    this.totalprice,
    this.catogeryname,
  }) : super(key: key);

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString("50372282");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.30,
        child: Wrap(
          children: List.generate(products.length, (index) {
            // return Column(
            //   children:
            //       List.generate(products[index].productInfo.length, (subIndex) {
            //         var productInfo = products[index].productInfo[subIndex];
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
                                        products[index].productInfo.image)),
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
                              top: size.height * 0.02, left: size.width * 0.03),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Flexible(
                                  child: Text(
                                    "${products[index].productInfo.name}",
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

                              // Container(

                              //     child: Text(
                              //       "25% OFF",
                              //       style: TextStyle(fontSize: size.width * 0.05,color: Colors.red),
                              //     ),

                              // ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              /*  Container(
                              child: RichText(
                                text: new TextSpan(
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: size.height * 0.02),
                                  children: <TextSpan>[
                                    new TextSpan(text: 'Status :  '
                                    ),
                                    new TextSpan(
                                       // text: status,
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: size.height * 0.021)),
                                  ],
                                ),
                              ),
                            ),*/
                            ],
                          ),
                        ),
                      ],
                    ),

                    /*Positioned(
                  top: size.height * 0.040,
                  right: size.width * 0.03,
                  child: Container(
                    child: Text("$date"),
                  ),
                ),*/

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
                              style: TextStyle(fontSize: size.width * 0.032),
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
                                    fontWeight: FontWeight.w400, fontSize: 18)),
                            TextSpan(
                                text: "${products[index].productInfo.price}",
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
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.height * 0.03,
                          child: QuaintityIncreament(

                              // products[index]
                              //     .productInfo
                              //     .productId,
                              )),
                    ),
                    Positioned(
                      top: size.height * 0.040,
                      right: size.width * 0.00,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: FlatButton.icon(
                            onPressed: () async => {
                              await removeItem(
                                products[index].productInfo.productId
                              )
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
                    // Positioned(
                    //   top: size.height * 0.015,
                    //   left: size.width * 0.30,
                    //   child: Container(
                    //       decoration:
                    //           BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    //       child: CircleAvatar(
                    //         child: Text(
                    //           "score",
                    //           style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                    //         ),
                    //         radius: 12,
                    //         backgroundColor: Colors.red,
                    //       )),
                    // ),
                  ],
                ),
              ),
            );
            //   }
            //   ),
            // );
          }),
        ));
  }
}

// FlatButton.icon(
//             onPressed: () async => {
//               await removeItem("2").then((_) {
//                 cartBloc.fetchCartItems(phoneNumber);
//               }),
//             },
//             icon: Icon(Icons.close,color: Colors.red,),
//             label: Text("Remove",style: TextStyle(color: Colors.red),),
//           )
