import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fatburger/constants/values.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:fatburger/model/foods_response.dart' as prefix0;
import 'package:fatburger/notifier/cart_model.dart';
import 'package:fatburger/pages/food_menu.dart';
import 'package:fatburger/pages/user_profile.dart';
import 'package:fatburger/resources/api_provider.dart';
import 'package:fatburger/widgets/cart_bottom_sheet.dart';
import 'package:fatburger/widgets/food_card.dart';
import 'package:fatburger/widgets/static_food_menu/food1.dart';

import 'package:fatburger/widgets/static_food_menu/hot_drinks.dart';
import 'package:fatburger/widgets/static_food_menu/iceCreams1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int value = 1;

  Future<FoodResponse> foodModels;
  StreamController<FoodResponse> streamController =
      StreamController();
  ApiProvider apiProvider = ApiProvider();
  String image1;

  int _selectedTab = 0;

  onInitData() async {
    try {
      streamController.add(null);
      FoodResponse foodModel =
          await apiProvider.fetchAllFoods();
      streamController.add(foodModel);
    } catch (e) {
      streamController.addError('${e.toString()}');
    }
  }

  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }

  viewProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => UserProfilePage()),
    );
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length:  4);
    _tabController.addListener((){
      _selectedTab = _tabController.index;
      setState(() {});
    });
    onInitData();
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin:
            EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            buildAppBar(),
            offerImageCarasol(context),
            buildFoodFilter(),
            Divider(),
            // buildFoodList(),
          ],
        ),
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
                  icon: //Image.network("https://cdn3.iconfinder.com/data/icons/hotel-service-gray-set-1/100/Untitled-1-02-512.png"),
                      Image.asset("images/cart2.png"),
                  onPressed: showCart),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white),
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

  TabController _tabController;

  Widget buildFoodFilter() { 
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.56,
        child: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
            TabBar(
              //FOR BOTH MESSAGES AND NOTIFICATIONS
              
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey, 
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  child: Image.network(
                      "https://i.pinimg.com/originals/00/cc/b6/00ccb6f59d1215f5666ad229af120e9f.png",
                      color: _selectedTab == 0
                          ? Colors.red
                          : Colors.black,
                      height: 30),
                ),
                Tab(
                  child: Image.network(
                    "https://icons-for-free.com/iconfiles/png/512/bakery+svg+line+ice+cream-1319964862462914601.png",
                      color: _selectedTab == 1
                          ? Colors.red
                          : Colors.black,
                    height: 30,
                  ),
                ),
                Tab(
                  child: Image.network(
                      "https://icons-for-free.com/iconfiles/png/512/bakery+svg+line+ice+cream-1319964862462914601.png",
                      color: _selectedTab == 2
                          ? Colors.red
                          : Colors.black, height: 30),
                ),
                Tab(
                  child: Image.network(
                    "https://icons-for-free.com/iconfiles/png/512/bakery+svg+line+ice+cream-1319964862462914601.png",
                      color: _selectedTab == 3
                          ? Colors.red
                          : Colors.black,
                    height: 30,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  HomeTopProperty(),
                  IceCreams(),
                  Food1(),
                  Food1()
                ],
              ),
            )
          ], 
      ),
    ));
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
    // );
  }

  Widget buildFoodList() {
    return FoodCard();
    /*Expanded(
      child: StreamBuilder<FoodResponse>(
        stream: streamController.stream,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              childAspectRatio: 0.65,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              crossAxisCount: 2,
              physics: BouncingScrollPhysics(),
              children: snapshot.data.foods.map((food) {
                return  ;
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );*/
  }
}

Widget offerImageCarasol(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.20,
    child: new Swiper(
      autoplay: true,
      duration: 2000,
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "http://www.burgerking.co.za/media/5556/website-banners-2-for-r60.jpg?anchor=center&mode=crop&width=1800&height=760&rnd=132125106250000000",
          fit: BoxFit.fill,
        );
      },
      itemCount: 10,
      viewportFraction: 0.8,
      scale: 0.9,
    ),
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
