import 'package:fatburger/BLOCS/Cart_Bloc.dart';
import 'package:fatburger/BLOCS/Get_Cart_Bloc.dart';
import 'package:fatburger/BLOCS/State_Managment.dart';
import 'package:flutter/material.dart';

class PluseAndMinus extends StatelessWidget {
  int productId;
  PluseAndMinus({
    this.productId,
  });
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Number Count",
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      home: new NumberCountDemo(
        productId: productId,
      ),
    );
  }
}

class NumberCountDemo extends StatefulWidget {
  int productId;
  NumberCountDemo({
    this.productId,
  });
  @override
  _NumberCountDemoState createState() => _NumberCountDemoState();
}

class _NumberCountDemoState extends State<NumberCountDemo> {
  int count = 0;
  void add() async {
    setState(() {
      count++;
    });
    //  await stateManagmentData.setProductValue(widget.productId);
  }

  void minus() async {
    setState(() {
      if (count != 0) count--;
    });
    //await dataofAddingProperty.setbathRooomCount(bathroom);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular(0),
            ),
            border: Border.all(color: Colors.black12)),
        width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.04,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.height * 0.03,
              child: RaisedButton(
                elevation: 0,
                shape:
                    RoundedRectangleBorder(), //(side: BorderSide(color: Colors.black12)),
                padding: const EdgeInsets.all(0.0),
                textColor: Colors.white,
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    if (count != 0) count--;
                    removingfromCart();
                  });
                },
                child: new Icon(
                    const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                    size: 20,
                    color: Colors.green),
              ),
            ),
            Text('$count',
                style: new TextStyle(fontSize: 20.0, color: Colors.green)),
            Container(
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.height * 0.03,
              child: RaisedButton(
                elevation: 0,
                shape:
                    RoundedRectangleBorder(), //(side: BorderSide(color: Colors.black12)),
                padding: const EdgeInsets.all(0.0),
                textColor: Colors.white,
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    count++;

                    addingtoCart();
                  });
                },
                child: new Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addingtoCart() async {
    await getCartBloc.additemsToCart(
        widget.productId,count);
  }

  removingfromCart() async {
    await cartBloc.removeProductFromCart("${widget.productId}", "50372282");
  }
}
