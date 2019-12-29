import 'dart:async';


import 'package:flutter/material.dart';
import 'package:kyankafe/notifier/cart_model.dart';
import 'package:kyankafe/widgets/bottom_navigation.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext ) {
    return ChangeNotifierProvider(
      builder: (context) => MyCart(),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        title: 'Flutter Food Ordering   ',
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
    //        routes: <String, WidgetBuilder>{
    //   '/HomeScreen': (BuildContext context) => new YoutubeMain()
    // },
        home: YoutubeMain()),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.black,
           height: MediaQuery.of(context).size.height * 1,
        child: new Image.asset('images/logo.png'),
      ),
    );
  }
}