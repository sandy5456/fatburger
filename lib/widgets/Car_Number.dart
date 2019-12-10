import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:pinput/pin_put/pin_put.dart';

void main() => runApp(PinPutTest());

class PinPutTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          hintColor: Colors.green,
        ),
        home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          color: Colors.black), 
            child: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.all(40.0),
                child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Center(
                            child: PinInputTextField(
                          pinLength: 6,
                          // decoration: _pinDecoration,
                          // controller: _pinEditingController,
                          autoFocus: true,
                          textInputAction: TextInputAction.go,
                          onSubmit: (String pin) => _showSnackBar(pin, context),
                        )))),
              ),
            ),
          ),
        ));
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 5),
      content: Container(
          height: 80.0,
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
}
