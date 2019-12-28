import 'package:fatburger/BLOCS/Fav_Post_Bloc.dart';
import 'package:fatburger/BLOCS/Get_Cart_Bloc.dart';
import 'package:fatburger/BLOCS/State_Managment.dart';
import 'package:fatburger/model/foods_response.dart';
import 'package:fatburger/widgets/QuantityIncreament.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toast/toast.dart';
class ColdDrinksMenu extends StatefulWidget {
    List<Food> foods;
  int cId;
  String name;
  ColdDrinksMenu({
    this.foods, this.name,this.cId
  });
  @override
  _ColdDrinksMenuState createState() => _ColdDrinksMenuState();
}

class _ColdDrinksMenuState extends State<ColdDrinksMenu> {
  bool isFavorite = true;
  @override
   Widget build(BuildContext context) {
    return 
///////////////////////////COFEE MENU///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////        
        Container(
         // color: Colors.blue,
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
              shrinkWrap: true,
            //  physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.foods.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.foods[index].catogeryid==49) {
                  
                
                return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                      InkWell(
                        onTap: () async => {alertBox(context, index)},
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.25,
                          height: MediaQuery.of(context).size.height * 0.25,
                          color: Colors.white,
                          child: Card(
                            color: Colors.transparent,
                            child:  Container(
                                      width: MediaQuery.of(context).size.height * 0.25,
                                      height: MediaQuery.of(context).size.height * 0.26,
                                      color: Colors.white,
                                       
                                        child: Container(
                                          //image
                                          // width: MediaQuery.of(context).size.height * 0.4,
                                          // height: MediaQuery.of(context).size.height * 0.8,
                                          decoration: BoxDecoration(
                                            image: new DecorationImage(
                                              image: new NetworkImage(
                                                  "http://142.93.219.45/upload/" +
                                                      widget.foods[index]
                                                          .images), //
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
                                                        0.06,
                                                child: Padding(
                                                  padding: EdgeInsets.all(0.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Container(
                                                           // color: Colors.blue,
                                                            width: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.3,
                                                            child: Text(
                                                              " ${widget.foods[index].name}",
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight:
                                                                      FontWeight.w300,
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.0,
                                                          ),
                                                          Text(
                                                            "QAR:${widget.foods[index].price}",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                                fontSize: 15),
                                                            textAlign: TextAlign.center,
                                                          ),
                                                        ],
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
                                                                splashColor:
                                                                    Colors.white70,
                                                                child: Icon(
                                                                  Icons.add,
                                                                  size: 16,
                                                                  color: Colors.white,
                                                                )),
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
                                    )
                      ,))
                    ],
                  ),
                );
            } else {
return Container(
width: 0.1,
);
                }  }),
        );
 ///////////////////////////////////COFEE2 MENU/////////////////////////////////////////////////////////////////////////////////////////       
      
 
        
  }

  addingtoCart(String pId,String quantity) async {
    await getCartBloc.addToCart(pId,quantity );
  }



  alertBox(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)), //this right here
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        image: new DecorationImage(
                          image: new NetworkImage(
                              "http://142.93.219.45/upload/"+widget.foods[index].images), //Image
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          //Name contanier
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.height * 0.04,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.01),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "   ${widget.foods[index].name}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                      Row(
                        children: <Widget>[
                          RatingBar(
                                              initialRating: 5.0,
                                              direction: Axis.horizontal,
                                              itemCount: 5,
                                              itemSize: 14,
                                              unratedColor: Colors.white,
                                              itemPadding:
                                                  EdgeInsets.only(right: 2.0),
                                              ignoreGestures: true,
                                              itemBuilder: (context, index) => Icon(
                                                  Icons.star,
                                                  color: Colors.yellow),
                                              onRatingUpdate: (rating) {},
                                            ),
                                              ButtonTheme(
                          buttonColor: Colors.white,
                          minWidth: 10.0,
                          height: 20.0,
                          child: InkWell(
                              onTap: () {
                                isFavorite = !isFavorite;
                                setState(() {
                                  if (isFavorite==false){
                                    addTofav(widget.foods[index].id, 50372282);
                                    Toast.show("added to favorite", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                                  }

                                });
                              },
                              child: isFavorite
                                  ? Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    )
                                  : Icon(Icons.favorite,color: Colors.red,)),
                        ),
                        ],
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.10,
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.015),
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              RichText(
                                
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      
                                        text: 'QAR',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 18)),
                                    TextSpan(
                                        text: ":${widget.foods[index].price}",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            fontSize: 18)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        Container(
                            //sq
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01),
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width * 0.30,
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: QuaintityIncreament()),
                      ],
                    ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0130,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.0685,
                        width: double.infinity, // match_parent
                        child: FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                             setState(() {
                              addingtoCart("${widget.foods[index].id}","${stateManagmentData.quantity}");
                              print(widget.foods[index].id);
                              print(stateManagmentData.quantity);
                             });
                            });
                          },
                          child: Text(
                            "CONFIRM",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ))
                  ],
                ),
              ));
        });
  }
  addTofav(var productId, var phone) async {
    await favPostBloc.addproductToFav(productId, phone);
  }
}

