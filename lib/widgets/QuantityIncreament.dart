
import 'package:fatburger/BLOCS/State_Managment.dart';
import 'package:flutter/material.dart';

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

class QuaintityIncreament extends StatefulWidget {

 
  @override
  _QuaintityIncreamentState createState() => _QuaintityIncreamentState();
}

class _QuaintityIncreamentState extends State<QuaintityIncreament> {
  int count = 0;
  void add() async {
    setState(() {
      count++;
    });
      //await stateManagmentData.setQuantityValue(count);
  }

  void minus() async {
    setState(() {
      if (count != 0) count--;
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
                    if (count != 0) count--;
                  
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
                    stateManagmentData.setQuantityValue(count);

                 
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

  
}
