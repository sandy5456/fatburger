import 'package:fatburger/PAGES/Dlivery_Option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

navigateToPage(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

popUpBox(BuildContext context) {
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
                  RadioListTile(
                    groupValue: 1,
                    value: 1,
                    title: Text(
                      "Kyaf",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onChanged: (val) {
                      popUpBox(context);
                    },
                    activeColor: Colors.white54,
                    selected: true,
                  ),
                  RadioListTile(
                    groupValue: 1,
                    value: 1,
                    title: Text(
                      "Car",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onChanged: (val) {
                      popUpBox(context);
                    },
                    activeColor: Colors.white54,
                    selected: true,
                  ),
                  RadioListTile(
                    groupValue: 1,
                    value: 1,
                    title: Text(
                      "OutSide",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onChanged: (val) {
                      popUpBox(context);
                    },
                    activeColor: Colors.white54,
                    selected: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
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
