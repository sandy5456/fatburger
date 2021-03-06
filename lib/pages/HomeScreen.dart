import 'dart:async';
import 'dart:io';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:kyankafe/BLOCS/Get_Cart_Bloc.dart';
import 'package:kyankafe/BLOCS/State_Managment.dart';
import 'package:kyankafe/BLOCS/offer_images_bolc.dart';
import 'package:kyankafe/BLOCS/propertybloc.dart';
import 'package:kyankafe/MODEL/OfferImage.dart';
import 'package:kyankafe/PAGES/SliderImage.dart';
import 'package:kyankafe/PAGES/tabBar.dart';
import 'package:kyankafe/constants/values.dart';
import 'package:kyankafe/notifier/cart_model.dart';

import 'package:provider/provider.dart';

import 'Bottom_Cart_sheet.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int value = 1;

  // Future<FoodResponse> foodModels;
  // StreamController<FoodResponse> streamController = StreamController();
  // ApiProvider apiProvider = ApiProvider();

  // onInitData() async {
  //   try {
  //     streamController.add(null);
  //     FoodResponse foodModel = await apiProvider.fetchAllFoods();
  //     streamController.add(foodModel);
  //   } catch (e) {
  //     streamController.addError('${e.toString()}');
  //   }
  // }

  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }

  // viewProfile() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => UserProfilePage()),
  //   );
  // }

  void initState() {
    // TODO: implement initState
    super.initState();
    propertyBloc.fetchAllCategory();
    offerImageBloc.fetchAllOfferImage();
    getCartBloc.fetchAllGetCartItem();
  }
  // @override
  // void dispose() {
  //   streamController.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.84,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            buildAppBar(),
            offerImageCarasol(context),
            // buildFoodList()
            //buildFoodFilter(),
            Tabbar()
          ],
        ),
        // child: Column(
        //   children: <Widget>[
        //     buildAppBar(),
        //     offerImageCarasol(context),
        //     buildFoodFilter(),

        //    // buildFoodList(),
        //   ],
        // ),
      ),
    );
  }

  Widget buildAppBar() {
    int items = 0;
    Provider.of<MyCart>(context).cartItems.forEach((cart) {
      items += cart.quantity;
    });
    return SafeArea(
      child: Row(
        children: <Widget>[
          // Image.asset('images/logo.png',
          //         width: MediaQuery.of(context).size.height * 0.10,
          //                     height: MediaQuery.of(context).size.height * 0.05,
          //  ),
          Text('MENU', style: headerStyle),
          Spacer(),
          //IconButton(icon: Icon(Icons.person), onPressed: viewProfile),
          // IconButton(
          //     icon: Icon(Icons.refresh),
          //     onPressed: () {
          //       onInitData();
          //     }),
          Stack(
            children: <Widget>[
              IconButton(
                  //Image.network("https://cdn3.iconfinder.com/data/icons/hotel-service-gray-set-1/100/Untitled-1-02-512.png"),
                  icon: prefix1.Image.asset("images/cart2.png"),
                  onPressed: showCart),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child:  stateManagmentData.cartItemLenght == null
                      ? Text("")
                      : stateManagmentData.cartItemLenght == 0
                          ? Text("")
                          : Text(
                              "${stateManagmentData.cartItemLenght}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // return Container(
  //   height: 50,
  //   //color: Colors.red,
  //   child: ListView(
  //     scrollDirection: Axis.horizontal,
  //     physics: BouncingScrollPhysics(),
  //     children: List.generate(FoodTypes.values.length, (index) {
  //       return Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: ChoiceChip(
  //           selectedColor: mainColor,
  //           labelStyle: TextStyle(color: value == index ? Colors.white : Colors.black),
  //           label: Text(FoodTypes.values[index].toString().split('.').last),
  //           selected: value == index,
  //           onSelected: (selected) {
  //             setState(() {
  //               value = index;
  //             });
  //           },
  //         ),
  //       );
  //     }),
  //   ),
}

// Widget buildFoodList() {
//   return Container(
//      height: MediaQuery.of(context).size.height * 0.65,
//     child: StreamBuilder<FoodResponse>(
//       stream: streamController.stream,
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           return GridView.count(
//             childAspectRatio: 0.65,
//             mainAxisSpacing: 4,
//             crossAxisSpacing: 4,
//             crossAxisCount: 2,
//             physics: BouncingScrollPhysics(),
//             children: snapshot.data.foods.map((food) {
//               return
//               Tabbar(
//                 catagoryname: snapshot.data.catogeryname,
//                 foods: snapshot.data.foods,
//               );
//             }).toList(),
//           );
//         } else if (snapshot.hasError) {
//           return Center(child: Text(snapshot.error.toString()));
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     ),
//   );
// }

Widget offerImageCarasol(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.19,
    child: StreamBuilder<List<OfferImageModel>>(
        stream: offerImageBloc.allofferImages,
        builder: (context, AsyncSnapshot<List<OfferImageModel>> snapshot) {
          if (snapshot.hasData) {
            //List<Aminety>aminities=snapshot.data[0].aminety;
            // aMINITES=snapshot.data[10].aminety;
            // iMAGES=snapshot.data[0].image;
            return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Imageswiper(
                  products: snapshot.data[index].products,
                );
              },
            );
          } else {
            return Center(
              child: SpinKitWave(
                color: Colors.black45,
                size: 25.0,
              ),
            );
          }
        }),
  );

  // return   Container(
  //                     /* decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.all(Radius.circular(7.0)),
  //                       image: new DecorationImage(
  //                         image: new AssetImage(widget.image), //Image
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),*/
  //                     child: Wrap(
  //                         children: List.generate(widget.image.length, (index) {
  //                       return Container(
  //                         width: MediaQuery.of(context).size.width,
  //                         height: MediaQuery.of(context).size.height * 0.3,
  //                         child: Swiper(
  //                           itemBuilder: (BuildContext context, int index) {
  //                             return new Image.network(
  //                                 "http://admin.realtyfinder.qa" +
  //                                     widget.image[index].imageName,fit: BoxFit.fill,);
  //                           },
  //                           itemCount: widget.image.length,
  //                           pagination: new SwiperPagination(),
  //                          // control: new SwiperControl(),
  //                         ),
  //                       );
  //                     })),
  //                     width: MediaQuery.of(context).size.width * 0.96,
  //                     height: MediaQuery.of(context).size.height * 0.3,
  //                   ),
}
