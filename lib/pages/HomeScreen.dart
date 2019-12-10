import 'dart:async';
import 'dart:io';

import 'package:fatburger/PAGES/Bottom_Cart_sheet.dart';

import 'package:fatburger/widgets/Cart_Item_Screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'package:fatburger/blocs/offer_images_bolc.dart';
import 'package:fatburger/blocs/propertybloc.dart';
import 'package:fatburger/constants/values.dart';

import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:fatburger/model/foods_response.dart' as prefix0;
import 'package:fatburger/notifier/cart_model.dart';
import 'package:fatburger/pages/SliderImage.dart';
import 'package:fatburger/pages/tabBar.dart';

import 'package:fatburger/pages/user_profile.dart';

import 'package:fatburger/widgets/cart_bottom_sheet.dart';
import 'package:fatburger/widgets/food_card.dart';
import 'package:fatburger/widgets/static_food_menu/food1.dart';

import 'package:fatburger/widgets/static_food_menu/hot_drinks.dart';
import 'package:fatburger/widgets/static_food_menu/iceCreams1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

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
  }
  // @override
  // void dispose() {
  //   streamController.close();
  //   super.dispose();
  // }

  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.88,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            buildAppBar(),
            offerImageCarasol(context),
            // buildFoodList()
            buildFoodFilter(),
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
                  child: Text(
                    '0',
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

  Widget buildFoodFilter() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.65,
      child: StreamBuilder<List<FoodResponse>>(
          stream: propertyBloc.allCategory,
          builder: (context, AsyncSnapshot<List<FoodResponse>> snapshot) {
            if (snapshot.hasData) {
              //List<Aminety>aminities=snapshot.data[0].aminety;
              // aMINITES=snapshot.data[10].aminety;
              // iMAGES=snapshot.data[0].image;
              return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Tabbar(
                        catagoryname: snapshot.data[index].catogeryname,
                        foods: snapshot.data[index].foods,
                      ),
                      // Tabbar(
                      //   catagoryname: snapshot.data[index].catogeryname,
                      //   foods: snapshot.data[index].foods,
                      // ),
                    ],
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
}

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
