import 'dart:convert';

import 'package:fatburger/widgets/static_food_menu/Cold_drinks.dart';
import 'package:fatburger/widgets/static_food_menu/Product-exps/product_exp.dart';
import 'package:fatburger/widgets/static_food_menu/icecream2.dart';
import 'package:fatburger/widgets/static_food_menu/increment_and_dicriment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

String productsJson =
    '{"last": [{"Shop_id":"Safari","images":"assets/shop1.jpg","name":"Test Tilte","price":"\$55.00"}, '
    '{"Shop_id":"Family store","images":"assets/shop2.jpg","name":"Test Tilte","price":"\$55.00"}, '
    '{"Shop_id":"Qatar mall","images":"assets/shop3.jpg","name":"Test Tilte","price":"\$55.00"}, '
    '{"Shop_id":"Doha store","images":"assets/shop4.jpg","name":"Test Tilte","price":"\$55.00"}, '
    '{"Shop_id":"Vilazo","images":"assets/shop5.jpg","name":"Test Tilte","price":"\$55.00"}, '
    '{"Shop_id":"Cerrifory","images":"assets/shop6.jpg","name":"Test Tilte","price":"\$55.00"}, '
    '{"Shop_id":"Ansar gallery","images":"assets/shop7.jpg","name":"Test Tilte","price":"\$55.00"}]}';

String categoriesJson = '{"categories":['
    '{"name":" Amercano","image":"images/i1.jpg","price":"30QR","beds":"  2 Beds ","baths":"2 Bath ","sq":"sq 37,000"}, '
    '{"name":"Espresso","image":"images/i2.jpg","price":"50 QR","beds":" 3 Beds ","baths":"3 Bath ","sq":"sq 37,000"}, '
    '{"name":"Latte Large","image":"images/i3.jpg","price":"25 QR","beds":" 3 Beds ","baths":"3 Bath ","sq":"sq 37,000"}, '
    '{"name":"special coffe","image":"images/i4.png","price":"30QR","beds":" 3Beds ","baths":"2 Bath ","sq":"sq 37,000"}]}';
/*
void main() => runApp( HomeTopProperty());

class HomeTopProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      home: Container(child: Center(child: Text("data")),)
    );
  }
}*/

class IceCreams extends StatefulWidget {
  IceCreams({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IceCreamsState createState() => _IceCreamsState();
}

class _IceCreamsState extends State<IceCreams> {
  final ScrollController _scrollController = ScrollController();

  /// final Test _test=Test();
  List<dynamic> products;
  List<dynamic> categories;

  @override
  initState() {
    super.initState();

    Map<String, dynamic> decoded = json.decode(productsJson);
    products = decoded['last'];

    Map<String, dynamic> decodedCategories = json.decode(categoriesJson);
    categories = decodedCategories['categories'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: <Widget>[
          Container(
     height: MediaQuery.of(context).size.height * 0.25,
            decoration: new BoxDecoration(
                /*image: new DecorationImage(
                  image: new AssetImage("assets/reg_bg.png"),
                  fit: BoxFit.cover,
                ),*/
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                color: Colors.white),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SizedBox(
                    //Size of the box

                    //width:  MediaQuery.of(context).size.height * 0.10 ,
                    height: MediaQuery.of(context).size.height *0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Map<String, String> category =
                            categories[index].cast<String, String>();
                        return GestureDetector(
                          onTap: () => {
                                                                                Alert(
                        
                          context: context,
                          title: category["name"],
                          content: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        category["price"],
                                      ),
                                      RatingBar(
                                                  initialRating: 5.0,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemSize: 16,
                                                  unratedColor: Colors.white,
                                                  itemPadding: EdgeInsets.only(
                                                      right: 4.0),
                                                  ignoreGestures: true,
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                          Icons.star,
                                                          color: Colors.yellow),
                                                  onRatingUpdate: (rating) {},
                                                ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    width: MediaQuery.of(context).size.height *
                                        0.15,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: PluseAndMinus(),
                                  ),
                                ],
                              )
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "CONFORM",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                          image: Image.asset(category["image"]),
                        ).show()

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomePropertyExpansion(
                            //             image: category["image"],
                            //             name: category["name"],
                            //             bed: category["beds"],
                            //             price: category["price"],
                            //             sq: category["sq"],
                            //             baths: category["baths"])))
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              
                              Container(
                                width: MediaQuery.of(context).size.height * 0.25,
                                height: MediaQuery.of(context).size.height * 0.25,
                                color: Colors.white,
                                child: Card(
                                  color: Colors.transparent,
                                  child: Container(
                                    //image
                                    // width: MediaQuery.of(context).size.height * 0.4,
                                    // height: MediaQuery.of(context).size.height * 0.8,
                                    decoration: BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage(category["image"]),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7.0)),
                                      color: Colors.white,
                                    ),

                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomCenter,
                                      children: <Widget>[
                                        Container(
                                          //name
                                          color: Colors.white,
                                          width: MediaQuery.of(context).size.width,

                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.07,
                                          child: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      category["name"],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 18),
                                                    ),
                                                    SizedBox(
                                                      width: 45,
                                                    ),
                                                    Text(
                                                      category["price"],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    // Image.asset("assets/loc.png",height: 20,),
                                                    RatingBar(
                                                      initialRating: 5.0,
                                                      direction: Axis.horizontal,
                                                      itemCount: 5,
                                                      itemSize: 14,
                                                      unratedColor: Colors.white,
                                                      itemPadding: EdgeInsets.only(
                                                          right: 4.0),
                                                      ignoreGestures: true,
                                                      itemBuilder:
                                                          (context, index) => Icon(
                                                              Icons.star,
                                                              color: Colors.yellow),
                                                      onRatingUpdate: (rating) {},
                                                    ),
                                                    Card(
                                                      margin:
                                                          EdgeInsets.only(left: 65),
                                                      color: Colors.green,
                                                      child: InkWell(
                                                        //onTap: addItemToCard,
                                                        splashColor: Colors.white70,

                                                        child: Icon(Icons.add,size: 16,color: Colors.white,)
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
              
                             
                              /* Row(
                                
                                children: <Widget>[
                                  Container(
                                        decoration: BoxDecoration(
                                          
                                    border: Border(right: BorderSide(color: Colors.black12))),
                                    width: MediaQuery.of(context).size.height * 0.12,
                                    height: MediaQuery.of(context).size.height * 0.03,
                                   
                                      padding: EdgeInsets.only(top: 1,left: 10),
                                    child: Row(
                                      
                                      children: <Widget>[
                                        
                                        Image.asset("assets/bed.png",height: 20,),
                                        //Icon(Icons.airline_seat_individual_suite,color: Colors.black,),
                                        Text(
                                                      category["beds"],
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight: FontWeight.normal,),textAlign: TextAlign.center,
                                                    ),
                                                         
                                      ],
                                      
                                    ),
                                               
                                  ),
                                     Container(
                                    width: MediaQuery.of(context).size.height * 0.12,
                                    height: MediaQuery.of(context).size.height * 0.03,
                                    color: Colors.transparent,
                                    padding: EdgeInsets.only(top: 1,left: 10),
                                    child: Row(
                                      children: <Widget>[
                                         Image.asset("assets/bath.png",height: 20,),
                                        // Icon(Icons.invert_colors,color: Colors.black,),
                                        Text(
                                                      category["baths"],
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontWeight: FontWeight.normal,),textAlign: TextAlign.center,
                                                    ),
                                                
                                      ],
                                    ),
                                                
                                  ),
                                ],
                              ),*/
                            ],
                          ),
                        );
                      },
                      itemCount: categories.length,
                    ),
                  ),
                ),
                /*SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      Map<String, String> product =
                          products[index].cast<String, String>();

                      return Card(
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7.0)),
                            image: new DecorationImage(
                              image: new AssetImage(product["images"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.0),
                            child: Center(
                              child: Text(
                                "${product["Shop_id"]}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: products.length,
                  ),
                ),*/
              ],
            ),
          ),
                          Container(
             height: MediaQuery.of(context).size.height * 0.25,
          child: IceCreams2(),
        ),
        ],
      ),
    );
  }
}
