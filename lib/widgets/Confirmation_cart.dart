

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter/material.dart';
import 'package:kyankafe/MODEL/Get_Cart_Model2.dart';
import 'package:kyankafe/constants/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmationCartItems extends StatelessWidget {
  String phoneNumber;
  String tableNo;
  String carNo;
  String outsideData;
  String totalPrice="25";
  String totalItems="5";
  List<CartProducts2> products;

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
                                  //  text: "${snapshot.data.totalprice}",
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
            //  Row(
            //   children: <Widget>[
            //     Text("  Total Items",style: subtitleStyle,),
            //     SizedBox(width: MediaQuery.of(context).size.width * 0.5),
            //    Text("${snapshot.data.} items",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.normal,
            //                           color: Colors.black54,
            //                           fontSize: 15))
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
  