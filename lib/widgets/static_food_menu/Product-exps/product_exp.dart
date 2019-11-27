
import 'package:fatburger/widgets/static_food_menu/Cold_drinks.dart';
import 'package:fatburger/widgets/static_food_menu/hot_drinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class HomePropertyExpansion extends StatefulWidget {
 final String image;
 final String name;
 final String bed;
 final String baths;
  final String price;
  final String sq;
 
HomePropertyExpansion (
  {this.image,
  this.name,
  this.bed,
  this.baths,
  this.price,
  this.sq
  }
);
  
  @override
  _HomePropertyExpansionState createState() => _HomePropertyExpansionState();

}

class _HomePropertyExpansionState extends State<HomePropertyExpansion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Image.asset('images/logo.png', 
            
            fit: BoxFit.cover)
            // title: Text(
            //   "Kafe Cafw",
            //   style:
            //       TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
            // ),
          ),
      body: Card(
                      
                        color: Colors.white,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.height * 0.50,
                              height: MediaQuery.of(context).size.height * 0.45,
                              color: Colors.white,
                              child: Card(
                                color: Colors.transparent,
                                child: Container(
                                  //image
                                  // width: MediaQuery.of(context).size.height * 0.4,
                                  // height: MediaQuery.of(context).size.height * 0.8,
                                  decoration: BoxDecoration(
                                    image: new DecorationImage(
                                      image: new AssetImage(widget.image),
                                      fit: BoxFit.fitHeight,
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
                                                   "${widget.name}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 20),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context).size.width *0.5
                                                  ),
                                                  Text(
                                                    "${widget.price}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
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
                                                    itemSize: 20,
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
                                                        EdgeInsets.only(left: MediaQuery.of(context).size.width *0.5),
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
                             SizedBox(
                                                height: 5,
                                              ),
                            Container(
                                         height: MediaQuery.of(context).size.height * 0.30,
                                        child: ColdDrinks(),
                                      )
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
                      ),
    );
  }
  }