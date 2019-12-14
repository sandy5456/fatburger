import 'package:fatburger/BLOCS/Cart_Bloc.dart';
import 'package:fatburger/MODEL/Cart_Model.dart';
import 'package:fatburger/MODEL/Get_Cart_Model.dart';
import 'package:fatburger/constants/values.dart';
import 'package:fatburger/widgets/static_food_menu/increment_and_dicriment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmationCartItems extends StatelessWidget {
  String phoneNumber;
  String tableNo;
  String carNo;
  String outsideData;
  String totalPrice="25";
  String totalItems="5";
  List<CartProducts> products;

  final Function removeItem;

  ConfirmationCartItems({
    Key key,
    this.carNo,
    this.outsideData,
    this.tableNo,
    this.phoneNumber,
    this.products,
    this.removeItem,
  }) : super(key: key);
  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString("50372282");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: size.height * 0.42,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(),
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Column(
                          children: <Widget>[
                            Container(
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
                                                  "${products[index].image}")),
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
                                                  "${products[index].name}",
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
                                      SizedBox(
                                        width: size.width * 0.02,
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

                                  // Positioned(
                                  //   top: size.height * 0.020,
                                  //   right: size.width * 0.05,
                                  //   child: Container(
                                  //     child: Row(
                                  //       children: <Widget>[
                                  //         Icon(
                                  //           Icons.star,
                                  //           color: Colors.yellow,
                                  //         ),
                                  //         Text(
                                  //           "4.5",
                                  //           style: TextStyle(fontSize: size.width * 0.032),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
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
                                              text: "${products[index].price}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.green,
                                                  fontSize: 18)),
                                        ],
                                      ),
                                    )),
                                  ),
                                  // Positioned(
                                  //   bottom: size.height * 0.022,
                                  //   left: size.width * 0.63,
                                  //   child: Container(
                                  //       width: MediaQuery.of(context).size.width * 0.22,
                                  //       height: MediaQuery.of(context).size.height * 0.03,
                                  //       child: PluseAndMinus(
                                  //         productId: products[index].productId,
                                  //       )),
                                  // ),
                                  // Positioned(
                                  //   top: size.height * 0.040,
                                  //   right: size.width * 0.00,
                                  //   child: Container(
                                  //       width: MediaQuery.of(context).size.width * 0.30,
                                  //       height: MediaQuery.of(context).size.height * 0.05,
                                  //       child: FlatButton.icon(
                                  //         onPressed: () async => {
                                  //           await removeItem("${products[index].productId}",).then((_) {
                                  //             cartBloc.fetchCartItems(phoneNumber);
                                  //           }),
                                  //         },
                                  //         icon: Icon(
                                  //           Icons.close,
                                  //           color: Colors.white,
                                  //         ),
                                  //         label: Text(
                                  //           "Remove",
                                  //           style: TextStyle(color: Colors.red[100]),
                                  //         ),
                                  //       )),
                                  // ),
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
                           
                          ],
                        ),
                      ));
                }),
          ),
           SizedBox(
              height: size.height*0.01,
            ),
            
          Container(
            color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.09,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(" Amount Payble",style: headerStyle,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.3),
                RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: 'QAR ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18)),
                              TextSpan(
                                    text: "$totalPrice",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 18)),
                            ],
                          ),
                        )
              ],
            ),
            SizedBox(
              height: size.height*0.03,
            ),
             Row(
              children: <Widget>[
                Text("  Total Items",style: subtitleStyle,),
                SizedBox(width: MediaQuery.of(context).size.width * 0.5),
               Text("$totalItems items",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54,
                                      fontSize: 15))
              ],
            )
            // Text("Will be Delivered To...",style: subtitleStyle,),
            // Row(
            //   children: <Widget>[
            //     Text("CarNo:$carNo",style: titleStyle2,),

            //     Text("TableNo:$tableNo",style: titleStyle2,),
            //     Text("$outsideData",style: titleStyle2,)
            //   ],
            // )
          ],
        ),
      )
        ],
   
    );
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
  