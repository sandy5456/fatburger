import 'package:fatburger/PAGES/offer_screen.dart';
import 'package:fatburger/widgets/Cart_Item_Screen.dart';
import 'package:fatburger/widgets/FlatBotton_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryOption extends StatefulWidget {
  @override
  _DeliveryOptionState createState() => _DeliveryOptionState();
}

class _DeliveryOptionState extends State<DeliveryOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)), //this right here
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: double.infinity, // match_parent
                        child: FlatButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          onPressed: () {
                           setState(() {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => OffferScreen()));
                           });
                          },
                          child: Text(
                            "kyaf",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ))
                  ],
                ),
              )));
  }


 
}
