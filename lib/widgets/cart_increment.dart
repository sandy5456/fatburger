

import 'package:flutter/material.dart';
import 'package:kyankafe/BLOCS/Get_Cart_Bloc.dart';
import 'package:kyankafe/BLOCS/State_Managment.dart';

// class QuaintityIncreament extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Number Count",
//       theme: new ThemeData(primarySwatch: Colors.blueGrey),
//       home: new NumberCountDemo(
        
//       ),
//     );
//   }
// }

class CartQuaintityIncreament extends StatefulWidget {
  int count;
  var productId;
CartQuaintityIncreament({
  this.count,
  this.productId
});
 
  @override
  _CartQuaintityIncreamentState createState() => _CartQuaintityIncreamentState();
}

class _CartQuaintityIncreamentState extends State<CartQuaintityIncreament> {
  
  void add() async {
    setState(() {
      widget.count++;
    });
      //await stateManagmentData.setQuantityValue(count);
  }

  void minus() async {
    setState(() {
      if (widget.count != 0) widget.count--;
    });
    //await stateManagmentData.setQuantityValue(count);
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
                    if (widget.count != 0) widget.count--;
                  updateToCart("${widget.productId}","${widget.count}" );
                  });
                },
                child: new Icon(
                    const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                    size: 20,
                    color: Colors.green),
              ),
            ),
            Text('${widget.count}',
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
                   widget. count++;
                    stateManagmentData.setQuantityValue(widget.count);
                      updateToCart("${widget.productId}","${widget.count}" );
                 
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

  updateToCart(String pId,String quantity) async {

    await getCartBloc.updateToCart(pId,quantity );
  }
  
}
