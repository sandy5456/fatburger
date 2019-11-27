import 'package:flutter/material.dart';


class PluseAndMinus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Number Count",
      theme: new ThemeData(primarySwatch: Colors.blueGrey),
      home: new NumberCountDemo(),
    );
  }
}

class NumberCountDemo extends StatefulWidget {
  @override
  _NumberCountDemoState createState() => _NumberCountDemoState();
}

class _NumberCountDemoState extends State<NumberCountDemo> {
  int count = 0;
  void add() async {
    setState(() {
      count++;
    });
    //await dataofAddingProperty.setbathRooomCount(bathroom);
  }

  void minus()async {
    setState(() {
      if (count != 0) count--;
    });
    //await dataofAddingProperty.setbathRooomCount(bathroom);
  }

  @override
  Widget build(BuildContext context) {
    return 
              Material(
        type: MaterialType.transparency,
                child: Container(
       
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.04,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
             
                                        
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.height * 0.03,
                 child: RaisedButton(
                   elevation: 1,
                 shape:RoundedRectangleBorder(),//(side: BorderSide(color: Colors.black12)),
                        padding: const EdgeInsets.all(0.0),
                        textColor: Colors.white,
                        color: Colors.white,
                        onPressed: minus,
                        child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      size: 20,
                      color: Colors.green),
                      ),
            
            ),
            
            
             Text('$count', style: new TextStyle(fontSize: 20.0,color: Colors.green)),
            
            Container(
                
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.height * 0.03,
                 child:RaisedButton(
                   elevation: 1,
             shape:RoundedRectangleBorder(),//(side: BorderSide(color: Colors.black12)),
                        padding: const EdgeInsets.all(0.0),
                        textColor: Colors.white,
                        color: Colors.white,
                        onPressed: add,
                        child: new Icon(
                    Icons.add,size: 20,
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
