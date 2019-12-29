
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kyankafe/BLOCS/Get_Cart_Bloc.dart';
import 'package:kyankafe/BLOCS/Get_fav_Bloc.dart';
import 'package:kyankafe/BLOCS/Offer_product_bloc.dart';
import 'package:kyankafe/BLOCS/offer_images_bolc.dart';
import 'package:kyankafe/MODEL/get_fav_Model.dart';
import 'package:kyankafe/PAGES/HomeScreen.dart';
import 'package:toast/toast.dart';

class OffferScreen extends StatefulWidget {
  @override
  _OffferScreenState createState() => _OffferScreenState();
}

class _OffferScreenState extends State<OffferScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    offerImageBloc.fetchAllOfferImage();
    offerproductBloc.fetchAllOfferProduct();
    getFavBloc.fetchAllfavList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        //   onPressed: () => Navigator.pop(context, true),
        // ),
        elevation: 0.3,
        backgroundColor: Colors.white,
        title: Text(
          "OFFERS",
          style: TextStyle(color: Colors.black),
        ),
        // title: Image.asset('images/logo.png',

        // fit: BoxFit.cover)
        // title: Text(
        //   "Kafe Cafw",
        //   style:
        //       TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
        // ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            offerImageCarasol(context),
            // buildFoodList()
            offerProducts(),
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

  Widget offerProducts() {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 10,
      child: StreamBuilder<List<GetFavModel>>(
          stream: getFavBloc.allfav,
          builder: (context, AsyncSnapshot<List<GetFavModel>> snapshot) {
            if (snapshot.hasData) {
              //List<Aminety>aminities=snapshot.data[0].aminety;
              // aMINITES=snapshot.data[10].aminety;
              // iMAGES=snapshot.data[0].image;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: size.height * 0.19,
                      width: size.width * 1,
                      padding: EdgeInsetsDirectional.only(
                          start: size.width * 0.01, end: size.width * 0.01),
                      child: Stack(
                        children: <Widget>[
                          Card(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            "http://142.93.219.45/upload/" +
                                                snapshot.data[index].image)),
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
                                            snapshot.data[index].productname,
                                            overflow: TextOverflow.visible,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.035),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Container(
                                        child: Text(
                                          "best selling",
                                          style: TextStyle(
                                              fontSize: size.width * 0.032,
                                              color: Colors.black26),
                                        ),
                                      ),

                                      ///FAV ICON I HERE
                                      ButtonTheme(
                                        buttonColor: Colors.white,
                                        minWidth: 10.0,
                                        height: 20.0,
                                        child: RaisedButton(
                                          onPressed: () {
                                            addingtoCart(
                                                "${snapshot.data[index].id}",
                                                "1");
                                            print(snapshot.data[index].id);
                                            print(1);
                                              Toast.show("added to cart", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
                                          },
                                          child: Text(
                                            "Add",
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
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
                                    style:
                                        TextStyle(fontSize: size.width * 0.032),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.055,
                            right: size.width * 0.04,
                            child: Container(
                                child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(text: 'QAR'),
                                  TextSpan(
                                      text: "${snapshot.data[index].price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 18)),
                                ],
                              ),
                            )),
                          ),
                          Positioned(
                            bottom: size.height * 0.018,
                            left: size.width * 0.41,
                            child: Container(
                                child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "${snapshot.data[index].price}%",
                                      style: TextStyle(
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
                          ),
                        ],
                      ),
                    );
                  });
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
  }

  addingtoCart(String pId, String quantity) async {
    await getCartBloc.addToCart(pId, quantity);
  }
}
