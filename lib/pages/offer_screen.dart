import 'package:fatburger/blocs/Offer_product_bloc.dart';
import 'package:fatburger/blocs/offer_images_bolc.dart';
import 'package:fatburger/model/Offer_product_model.dart';
import 'package:fatburger/pages/HomeScreen.dart';
import 'package:fatburger/widgets/Offer_List_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return 
    Scaffold(
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
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 10,
      child: StreamBuilder<List<OfferProductModel>>(
          stream: offerproductBloc.allofferProducts,
          builder: (context, AsyncSnapshot<List<OfferProductModel>> snapshot) {
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
                      OfferProductListCard(
                        products: snapshot.data[index].products,
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
}
