
import 'package:flutter/material.dart';
import 'package:kyankafe/BLOCS/Payment_Bloc.dart';
import 'package:kyankafe/MODEL/Payment_model.dart';
import 'package:kyankafe/PAGES/Confirmation_page.dart';

class CraditCardForm1 extends StatefulWidget {
  String tableNo;
  String carNo;
  String outsideData;
  String paymentOption;
  CraditCardForm1(
      {this.carNo, this.outsideData, this.tableNo, this.paymentOption});

  @override
  _CraditCardForm1State createState() => _CraditCardForm1State();
}

class _CraditCardForm1State extends State<CraditCardForm1> {
  PaymentModel paymentModel;
  final cardNoController = TextEditingController();
  final expDateController = TextEditingController();
  final cvvController = TextEditingController();
  final nameController = TextEditingController();
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
        title: Text(
          "Payment",
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
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.height * 0.05,
            child: Column(
              children: <Widget>[
                Image.asset("images/credit.png"),
                Divider(
                  color: Colors.white60,
                ),
                cardNoField(context, cardNoController, "xxxx-xxxx-xxxx"),
                Divider(),
                expdateField(context, expDateController, "Exp/date"),
                
                Divider(),
                cvvField(context, cvvController, "cvv"),
                Divider(),
                cardNnameField(context, nameController, "card name"),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.071,
                    width: double.infinity, // match_parent
                    child: FlatButton(
                      color: Colors.white,
                      textColor: Colors.black,
                      onPressed: () async{
                        paymentModel=new PaymentModel(
                          cardNo: cardNoController.text,
                          cardName: nameController.text,
                          cvv: cvvController.text,
                          expDate: expDateController.text

                        );
                       paymentBloc.addPostData(paymentModel);
                        print( cardNoController.text,);
                        print(nameController.text,);
                        print(nameController.text,);
                        print(expDateController.text);
                        

                        showDialog(
                            context: context,
                            builder: (context) {
                              return ConFirmationPage(
                                 outsideData: widget.outsideData,
                              tableNo: widget.tableNo,
                              carNo: widget.carNo,
                              paymentOption: "online",
                              );
                            });
                      },
                      child: Text(
                        "CONFIRM",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardNoField(BuildContext context, controller, hint) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.01,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        child: InkWell(
            child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: TextFormField(
                  controller: controller,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        )),
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    hintText: hint,
                  ),
                ))));
  }
  Widget expdateField(BuildContext context, controller, hint) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.01,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        child: InkWell(
            child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: TextFormField(
                  controller: controller,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        )),
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    hintText: hint,
                  ),
                ))));
  }
    Widget cvvField(BuildContext context, controller, hint) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.01,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        child: InkWell(
            child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: TextFormField(
                  controller:controller,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        )),
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    hintText: hint,
                  ),
                ))));
  }
  Widget cardNnameField(BuildContext context, controller, hint) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.01,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03),
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        child: InkWell(
            child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white,
                ),
                child: TextFormField(
                  controller:controller,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        )),
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    hintText: hint,
                  ),
                ))));
  }
}
