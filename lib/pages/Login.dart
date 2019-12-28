import 'dart:convert';


import 'package:fatburger/PAGES/register.dart';
import 'package:fatburger/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password, phone;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http
        .post("http://127.0.0.1:59768/login", body: {
      "flag": 1.toString(),
      "phone":phone,
      // "email": email,
      "password": password,
      "fcm_token": "test_fcm_token"
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    String emailAPI = data['email'];
    String nameAPI = data['name'];
    String id = data['id'];

    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, emailAPI, nameAPI, id);
      });
      print(message);
      loginToast(message);
    } else {
      print("fail");
      print(message);
      loginToast(message);
    }
  }

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  savePref(int value, String email, String name, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.setString("name", null);
      preferences.setString("email", null);
      preferences.setString("id", null);

      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          
         backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
                new Container(
          // decoration: new BoxDecoration(
          //   image: new DecorationImage(
          //     image: new NetworkImage("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c8f262ca-fdb6-4055-8632-aeec6908ac35/d1y3wdf-25f67a0f-5418-4133-9aae-57bc777d2523.png/v1/fill/w_594,h_660,q_80,strp/fat_burger_logo_by_kryptid_d1y3wdf-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjYwIiwicGF0aCI6IlwvZlwvYzhmMjYyY2EtZmRiNi00MDU1LTg2MzItYWVlYzY5MDhhYzM1XC9kMXkzd2RmLTI1ZjY3YTBmLTU0MTgtNDEzMy05YWFlLTU3YmM3NzdkMjUyMy5wbmciLCJ3aWR0aCI6Ijw9NTk0In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.JJP1_OCZen9_pKhilqjRh3tdVVx-38lYIW2XMKoCjK4"), fit: BoxFit.cover,),
          // ),
        ),
              Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15.0),
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
//            color: Colors.grey.withAlpha(20),
                        color: Colors.transparent,
                        child: Form(
                          key: _key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[   Image.network(
                                 "https://upload.wikimedia.org/wikipedia/en/thumb/3/32/Fatburger_logo.svg/404px-Fatburger_logo.svg.png",
                            ),
                           
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 50,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),

                              //card for Email TextFormField
                              Card(
                                elevation: 6.0,
                                child: TextFormField(
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "Please Insert mobile number";
                                    }
                                  },
                                  onSaved: (e) => phone = e,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding:
                                            EdgeInsets.only(left: 20, right: 15),
                                        child:
                                            Icon(Icons.person, color: Colors.black),
                                      ),
                                      contentPadding: EdgeInsets.all(18),
                                       border: InputBorder.none,
                                      labelText: "Email",
                                      labelStyle: new TextStyle(color: Colors.black38)
                                      ),
                                ),
                              ),

                              // Card for password TextFormField
                              //    Card(
                              //   elevation: 6.0,
                              //   child: TextFormField(
                              //     validator: (e) {
                              //       if (e.isEmpty) {
                              //         return "Phone Number Can't be Empty";
                              //       }
                              //     },
                                 
                              //     onSaved: (e) => phone = e,
                              //     style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.w300,
                              //     ),
                              //     decoration: InputDecoration(
                              //       border: InputBorder.none,
                              //       labelText: "Phone",
                              //        labelStyle: new TextStyle(color: Colors.black38),
                              //       prefixIcon: Padding(
                              //         padding: EdgeInsets.only(left: 20, right: 15),
                              //         child: Icon(Icons.phonelink_lock,
                              //             color: Colors.black),
                              //       ),
                                   
                              //       contentPadding: EdgeInsets.all(18),
                              //     ),
                              //   ),
                              // ),
                              Card(
                                elevation: 6.0,
                                child: TextFormField(
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "Password Can't be Empty";
                                    }
                                  },
                                  obscureText: _secureText,
                                  onSaved: (e) => password = e,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Password",
                                     labelStyle: new TextStyle(color: Colors.black38),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.phonelink_lock,
                                          color: Colors.black),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: showHide,
                                      color: Colors.red[300],
                                      icon: Icon(_secureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                    contentPadding: EdgeInsets.all(18),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 12,
                              ),

                              FlatButton(
                                onPressed: null,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(14.0),
                              ),

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(
                                    height: 44.0,
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        textColor: Colors.white,
                                        color:Colors.red,// Color(0xFFf7d426),
                                        onPressed: () {
                                          check();
                                        }),
                                  ),
                                  SizedBox(
                                    height: 44.0,
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Text(
                                          "GoTo Register",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.red,//Color(0xFFf7d426),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Register()),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        break;

      case LoginStatus.signIn:
        return YoutubeMain();
//        return ProfilePage(signOut);
        break;
    }
  }
}