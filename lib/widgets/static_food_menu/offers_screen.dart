// import 'package:fatburger/blocs/offer_images_bolc.dart';
// import 'package:fatburger/blocs/propertybloc.dart';
// import 'package:fatburger/pages/HomeScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

// class OffersScreen extends StatefulWidget {
//   @override
//   _OffersScreenState createState() => _OffersScreenState();
// }

// class _OffersScreenState extends State<OffersScreen> {
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     offerImageBloc.fetchAllOfferImage();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//        appBar: AppBar(
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: () => Navigator.pop(context, false),
//             ),
//             elevation: 0.3,
//             backgroundColor: Colors.white,
//             title: Text("OFFERS",style:TextStyle(color: Colors.black),),
//             // title: Image.asset('images/logo.png', 
            
//             // fit: BoxFit.cover)
//             // title: Text(
//             //   "Kafe Cafw",
//             //   style:
//             //       TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
//             // ),
//           ),
//       body: Column(
//         children: <Widget>[
//           Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.20,
//       child:  offerImageCarasol(context),
//       // child: new Swiper(
//       //   autoplay: false,
//       //   duration: 2000,
//       //   itemBuilder: (BuildContext context, int index) {
//       //     return new Image.network(
//       //       "http://www.burgerking.co.za/media/5556/website-banners-2-for-r60.jpg?anchor=center&mode=crop&width=1800&height=760&rnd=132125106250000000",
//       //       fit: BoxFit.fill,
//       //     );
//       //   },
//       //   itemCount: 10,
//       //   viewportFraction: 0.8,
//       //   scale: 0.9,
//       // ),
//   ),
//           Container(
//             height: size.height * 0.19,
//             width: size.width * 1,
//             padding: EdgeInsetsDirectional.only(
//                 start: size.width * 0.01, end: size.width * 0.01),
//             child: Stack(
//               children: <Widget>[
//                 Card(
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                             decoration: BoxDecoration(
//           image: DecorationImage(
//                 fit: BoxFit.fitHeight,
//                 image: AssetImage("images/f3.jpg")
//               ),
//           borderRadius: BorderRadius.all(Radius.circular(8.0)),),
//                           padding:
//                               EdgeInsetsDirectional.only(start: size.width * 0.05),
//                           height: size.height * 0.17,
//                           width: size.width * 0.39,
//                           ),
//                       Container(
//                         width: size.width * 0.4,
//                         padding: EdgeInsets.only(top: size.height * 0.02,left:size.width * 0.03 ),
//                         child: Column(
//                           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Container(
//                               child: Flexible(
//                                 child: Text(
//                                   "IceCream",
//                                   overflow: TextOverflow.visible,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: size.width * 0.035),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: size.height * 0.01,
//                             ),
//                             Container(
                             
//                                 child: Text(
//                                   "best selling",
//                                   style: TextStyle(fontSize: size.width * 0.032,color: Colors.black26),
//                                 ),
                             
//                             ),
//                             ButtonTheme(
//                               buttonColor: Colors.white,
//                               minWidth: 10.0,
//                               height: 20.0,
//                               child: RaisedButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   "Add",
//                                   style: TextStyle(color: Colors.green),
//                                 ),
//                               ),
//                             ),
//                             Container(
                             
//                                 child: Text(
//                                   "25% OFF",
//                                   style: TextStyle(fontSize: size.width * 0.05,color: Colors.red),
//                                 ),
                             
//                             ),
//                             SizedBox(
//                               height: size.height * 0.01,
//                             ),
//                             /*  Container(
//                                 child: RichText(
//                                   text: new TextSpan(
//                                     style: new TextStyle(
//                                         color: Colors.black,
//                                         fontSize: size.height * 0.02),
//                                     children: <TextSpan>[
//                                       new TextSpan(text: 'Status :  '
//                                       ),
//                                       new TextSpan(
//                                          // text: status,
//                                           style: new TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.green,
//                                               fontSize: size.height * 0.021)),
//                                     ],
//                                   ),
//                                 ),
//                               ),*/
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: size.width * 0.02,
//                       ),
//                     ],
//                   ),
//                   elevation: 3.0,
//                 ),
//                 /*Positioned(
//                     top: size.height * 0.040,
//                     right: size.width * 0.03,
//                     child: Container(
//                       child: Text("$date"),
//                     ),
//                   ),*/
//                 Positioned(
//                   top: size.height * 0.020,
//                   right: size.width * 0.05,
//                   child: Container(
//                     child: Row(
//                       children: <Widget>[
//                         Icon(Icons.star,color: Colors.yellow,),
//                         Text(
//                           "4.5",
//                           style: TextStyle(fontSize: size.width * 0.032),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: size.height * 0.055,
//                   right: size.width * 0.04,
//                   child: Container(
//                     child: Text(
//                       "Qr 50",
//                       style: TextStyle(
//                           color: Colors.red,
//                           fontWeight: FontWeight.bold,
//                           fontSize: size.width * 0.04),
//                     ),
//                   ),
//                 ),
//                 // Positioned(
//                 //   top: size.height * 0.015,
//                 //   left: size.width * 0.30,
//                 //   child: Container(
//                 //       decoration:
//                 //           BoxDecoration(shape: BoxShape.circle, color: Colors.red),
//                 //       child: CircleAvatar(
//                 //         child: Text(
//                 //           "score",
//                 //           style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
//                 //         ),
//                 //         radius: 12,
//                 //         backgroundColor: Colors.red,
//                 //       )),
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
