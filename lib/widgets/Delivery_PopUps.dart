import 'package:fatburger/BLOCS/State_Managment.dart';
import 'package:fatburger/PAGES/Dlivery_Option.dart';
import 'package:fatburger/widgets/Car_Number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return deliveryOptionPopUpBox(context);
  }
}

navigateToPage(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

deliveryOptionPopUpBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)), //this right here
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    child: Text(
                      "Choose your location",
                      style: TextStyle(color: Colors.white54, fontSize: 20),
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity, // match_parent
                      child: FlatButton(
                        color: Colors.black,
                        textColor: Colors.white38,
                        onPressed: () {
                          carNumberPopUPbox(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "images/chair.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.042,
                              color: Colors.white38,
                            ),
                            Text(
                              "      Kyaf",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity, // match_parent
                      child: FlatButton(
                        color: Colors.black,
                        textColor: Colors.white38,
                        onPressed: () {
                          navigateToPage(context, PinPutTest());
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "images/car.png",
                              // width:MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              color: Colors.white38,
                            ),
                            Text(
                              "       Car",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: double.infinity, // match_parent
                      child: FlatButton(
                        color: Colors.black,
                        textColor: Colors.white38,
                        onPressed: () {
                          carNumberPopUPbox(context);
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "images/chairr.png",
                              //  width:MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.5,
                              color: Colors.white38,
                            ),
                            Text(
                              "       OutSide",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                  // RadioListTile(
                  //   groupValue: 3,
                  //   value: 3,
                  //   title: Text(
                  //     "OutSide",
                  //     style: TextStyle(fontSize: 20.0),
                  //   ),
                  //   onChanged: (val) {
                  //     deliveryOptionPopUpBox(context);
                  //   },
                  //   activeColor: Colors.white54,
                  //   selected: true,
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.099,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: double.infinity, // match_parent
                      child: FlatButton(
                        color: Colors.white,
                        textColor: Colors.black,
                        onPressed: () {},
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )),
                ],
              ),
            ));
      });
}

carNumberPopUPbox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  "images/car.png",
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                ),
                Text("Enter Your Car Number",
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                PinInputTextField(
                  pinLength: 6,
                  decoration: BoxLooseDecoration(
                      strokeColor: Colors.white,
                      strokeWidth: 1,
                      textStyle: TextStyle(color: Colors.white)),
                  autoFocus: true,
                  textInputAction: TextInputAction.go,
                  onSubmit: (String pin) async {
                    // setState(){
                    //    _showSnackBar(pin, context);

                    // }
                    await stateManagmentData.setProductValue(pin);
                    print("enterd pin is$pin");
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.071,
                    width: double.infinity, // match_parent
                    child: FlatButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      onPressed: () {},
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
              ],
            )),
          ),
        );
      });
}

void _showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: Duration(seconds: 5),
    content: Container(
        height: 60.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: TextStyle(fontSize: 25.0),
          ),
        )),
    backgroundColor: Colors.greenAccent,
  );
  Scaffold.of(context).showSnackBar(snackBar);
  print(pin);
}
