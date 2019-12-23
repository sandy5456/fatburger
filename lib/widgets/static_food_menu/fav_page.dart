import 'package:fatburger/BLOCS/Fav_Post_Bloc.dart';
import 'package:fatburger/BLOCS/Get_fav_Bloc.dart';
import 'package:fatburger/MODEL/get_fav_Model.dart';
import 'package:fatburger/widgets/static_food_menu/increment_and_dicriment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavBloc.fetchAllfavList();
  }

  List<bool> isFavorite;

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
          //   onPressed: () => Navigator.pop(context, false),
          // ),
          elevation: 0.3,
          backgroundColor: Colors.white,
          title: Text(
            "FAVORITES",
            style: TextStyle(color: Colors.black),
          ),
          // title: Image.asset('images/logo.png', fit: BoxFit.cover)
          // title: Text(
          //   "Kafe Cafw",
          //   style:
          //       TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
          // ),
        ),
        body: ListView(
            // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                child: new Swiper(
                  autoplay: false,
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
              ),
              Container(
                child: StreamBuilder<List<GetFavModel>>(
                    stream: getFavBloc.allfav,
                    builder:
                        (context, AsyncSnapshot<List<GetFavModel>> snapshot) {
                      if (snapshot.hasData) {
                        if (isFavorite == null) {
                          isFavorite = List<bool>(snapshot.data.length);
                        }

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
                                    start: size.width * 0.01,
                                    end: size.width * 0.01),
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
                                                          snapshot.data[index]
                                                              .image)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
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
                                                      snapshot.data[index]
                                                          .productname,
                                                      overflow:
                                                          TextOverflow.visible,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: size.width *
                                                              0.035),
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
                                                        fontSize:
                                                            size.width * 0.032,
                                                        color: Colors.black26),
                                                  ),
                                                ),

                                                ///FAV ICON I HERE
                                                ButtonTheme(
                                                    buttonColor: Colors.white,
                                                    minWidth: 10.0,
                                                    height: 20.0,
                                                    child: InkWell(
                                                      onTap: () {
                                                        isFavorite[index] =
                                                            isFavorite[index] ==
                                                                    null
                                                                ? true
                                                                : !isFavorite[
                                                                    index];
                                                        setState(() {
                                                          if (isFavorite[
                                                              index]) {
                                                            removefav(
                                                              snapshot
                                                                  .data[index]
                                                                  .id,
                                                            );
                                                          } else {
                                                            {
                                                              addTofav(
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .pId,
                                                                  50372282);
                                                            }
                                                          }
                                                        });
                                                      },
                                                      child: isFavorite[
                                                                  index] ==
                                                              null
                                                          ? Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )
                                                          : isFavorite[index]
                                                              ? Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: Colors
                                                                      .red,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                    )),

                                                // Container(

                                                //     child: Text(
                                                //       "25% OFF",
                                                //       style: TextStyle(fontSize: size.width * 0.05,color: Colors.red),
                                                //     ),

                                                // ),
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
                                              style: TextStyle(
                                                  fontSize: size.width * 0.032),
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
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: <TextSpan>[
                                            TextSpan(text: 'QAR'),
                                            TextSpan(
                                                text:
                                                    "${snapshot.data[index].price}",
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          child: PluseAndMinus()),
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
                      } else {
                        return Center(
                          child: SpinKitWave(
                            color: Colors.black45,
                            size: 25.0,
                          ),
                        );
                      }
                    }),
              )
            ]));
  }

  removefav(var productId) async {
    await favPostBloc.removeProductFromFav(productId);
  }

  addTofav(var productId, var phone) async {
    await favPostBloc.addproductToFav(productId, phone);
  }
}
