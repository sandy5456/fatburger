import 'package:fatburger/BLOCS/State_Managment.dart';
import 'package:fatburger/PAGES/Confirmation_page.dart';
import 'package:fatburger/PAGES/Dlivery_Option.dart';
import 'package:fatburger/widgets/Car_Number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

navigateToPage(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

deliveryOptionPopUpBox(BuildContext context) {
  final tableNumberController = TextEditingController();
  final outSideController = TextEditingController();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)), //this right here
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.4,
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
                        onPressed: () async {
                          tableNumberPopUPbox(
                              context, tableNumberController, "Ex:12");
                          await stateManagmentData
                              .setTablenumberValue(tableNumberController.text);
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "images/cafe.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.042,
                              color: Colors.white38,
                            ),
                            Text(
                              "        Kyaf",
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
                              "images/sportscar.png",
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
                          outSidePopUPbox(
                              context, outSideController, "Landmark/Address");
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "images/location.png",
                              //  width:MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.5,
                              color: Colors.white38,
                            ),
                            Text(
                              "      OutSide",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
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
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Image.asset(
                  "images/sportscar.png",
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                ),
                Text("Enter Your Car Number",
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: PinInputTextField(
                    pinLength: 6,
                    decoration: BoxLooseDecoration(
                        strokeColor: Colors.white,
                        strokeWidth: 1,
                        textStyle: TextStyle(color: Colors.white)),
                    autoFocus: true,
                    //textInputAction: TextInputAction.go,
                    onSubmit: (String pin) async {
                    paymenOptionPopUpBox(context);

                      await stateManagmentData.setCarNumberValue(pin);
                      print("enterd pin is$pin");
                    },
                  ),
                ),
            
              ],
            )),
          ),
        );
      });
}

tableNumberPopUPbox(BuildContext context, acontroller, hint) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.455,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  "images/chair.png",
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                ),
                Text("Enter Your Table Number",
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                    // padding: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.width * 0.01,
                    //     left: MediaQuery.of(context).size.width * 0.00),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.height * 0.06,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: InkWell(
                      child: new Theme(
                        data: new ThemeData(
                          primaryColor: Colors.black,
                          primaryColorDark: Colors.black,
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          controller: acontroller,
                          decoration: InputDecoration(
                              // labelText: "Password",
                              hintText: hint,
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  //borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 0,
                                      color: Colors.white,
                                      style: BorderStyle.none))),
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.071,
                    width: double.infinity, // match_parent
                    child: FlatButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      onPressed: () async {
                      paymenOptionPopUpBox(context);
                        await stateManagmentData
                            .setTablenumberValue(acontroller.text);
                      },
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

outSidePopUPbox(BuildContext context, controller, hint) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.455,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset(
                  "images/chairr.png",
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                ),
                Text("Where to deliver",
                    style: TextStyle(fontSize: 20.0, color: Colors.white)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                    // padding: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.width * 0.01,
                    //     left: MediaQuery.of(context).size.width * 0.00),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.height * 0.3,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: InkWell(
                      child: new Theme(
                        data: new ThemeData(
                          primaryColor: Colors.black,
                          primaryColorDark: Colors.black,
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          controller: controller,
                          decoration: InputDecoration(
                              // labelText: "Password",
                              hintText: hint,
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  //borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 0,
                                      color: Colors.white,
                                      style: BorderStyle.none))),
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.071,
                    width: double.infinity, // match_parent
                    child: FlatButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      onPressed: () async{
                        paymenOptionPopUpBox(context);
                              await stateManagmentData
                            .setoutsideValue(controller.text);
                      },
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

paymenOptionPopUpBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)), //this right here
            child: Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    child: Text(
                      "Choose your Payment",
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
                            navigateToPage(
                            context,
                            ConFirmationPage(
                              outsideData: stateManagmentData.outsidedata,
                              tableNo: stateManagmentData.tableNumber,
                              carNo: stateManagmentData.carNumber,
                              paymentOption: "1",
                            ));
                            print(stateManagmentData.outsidedata,);
                            print(stateManagmentData.tableNumber);
                            print(stateManagmentData.carNumber);
                        },
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "images/cod.png",
                              height:
                                  MediaQuery.of(context).size.height * 0.05,
                              color: Colors.white38,
                            ),
                            Text(
                              "         Cod",
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
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "images/card.png",
                              // width:MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              color: Colors.white38,
                            ),
                            Text(
                              "       Online",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ],
                        ),
                      )),

                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.099,
                  // ),
                  // SizedBox(
                  //     height: MediaQuery.of(context).size.height * 0.07,
                  //     width: double.infinity, // match_parent
                  //     child: FlatButton(
                  //       color: Colors.white,
                  //       textColor: Colors.black,
                  //       onPressed: () {

                  //       },
                  //       child: Text(
                  //         "CONFIRM",
                  //         style: TextStyle(fontSize: 20.0),
                  //       ),
                  //     )),
                ],
              ),
            ));
      });
}
