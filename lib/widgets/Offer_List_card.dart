import 'package:fatburger/model/OfferImage.dart';
import 'package:fatburger/model/Offer_product_model.dart';
import 'package:fatburger/model/order_response.dart';
import 'package:fatburger/widgets/QuantityIncreament.dart';



import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class OfferProductListCard extends StatefulWidget {
  List<OfferProducts> products;

  OfferProductListCard({
    this.products,
  });
  @override
  _OfferProductListCardState createState() => _OfferProductListCardState();
}

class _OfferProductListCardState extends State<OfferProductListCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            height: size.height * 0.2,
            width: size.width * 1,
            padding: EdgeInsetsDirectional.only(
                start: size.width * 0.01, end: size.width * 0.01),
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () => {
                    Alert(
                            context: context,
                            title: "${widget.products[index].name}",
                            content: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          " QAR:${widget.products[index].price}",
                                        ),
                                        RatingBar(
                                          initialRating: 5.0,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemSize: 16,
                                          unratedColor: Colors.white,
                                          itemPadding:
                                              EdgeInsets.only(right: 4.0),
                                          ignoreGestures: true,
                                          itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.yellow),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: QuaintityIncreament(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                color: Colors.black,
                                onPressed: () => Navigator.pop(context),
                                //push(context,MaterialPageRoute(
                                // builder: (context)=>MyHomePage()
                                child: Text(
                                  "CONFIRM",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            ],
                            image: Image.network(widget.products[index].image))
                        .show()

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
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(
                                  widget.products[index].image,
                                )),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          padding: EdgeInsetsDirectional.only(
                              start: size.width * 0.05),
                          height: size.height * 0.17,
                          width: size.width * 0.39,
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
                                    widget.products[index].name,
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
                              ButtonTheme(
                                buttonColor: Colors.white,
                                minWidth: 10.0,
                                height: 20.0,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              Container(
                                  child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(text:"${widget.products[index].offer}%", style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.red,
                                            fontSize: 22)),
                                    TextSpan(
                                        text: 'OFF',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 15)),
                                  ],
                                ),
                              )),
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
                    elevation: 3.0,
                  ),
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
                  top: size.height * 0.055,
                  right: size.width * 0.04,
                  child: Container(
                    child:RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(text:"QAR", style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 18)),
                                    TextSpan(
                                        text: ":${widget.products[index].price}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize:19)),
                                  ],
                                ),
                              )
                  ),
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
          );
        });
  }
  
}
