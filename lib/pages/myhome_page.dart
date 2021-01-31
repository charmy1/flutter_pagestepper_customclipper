import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'file:///D:/FLutter%20FL%20Work/Persistent%20P/flutter_app_assignment1/lib/widgets/next_button.dart';
import 'package:flutterappassignment1/pages/password_page.dart';
import 'package:flutterappassignment1/widgets/my_inherited_progress_widget.dart';
//import 'package:flutterappassignment1/widgets/next_button.dart';

import '../widgets/number_row.dart';
import '../widgets/next_button.dart';
import '../constants.dart';
import '';

//First Page
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var _emailController = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  bool email;
  Color color1 = colorGrey;

  @override
  void initState() {
    super.initState();
    email = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorGrey,
        appBar: AppBar(
          title: Text('Create Account'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: <Widget>[
                              ClipPath(
                                clipper: _TopClipper(),
                                child: Container(
                                  height:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height / 4,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: MyInheritedProgressWidget(
                                  color1: color1,
                                  color2: colorGrey,
                                  color3: colorGrey,
                                  color4: colorGrey,
                                  child: NumberRow(
                                    color1: colorGrey,
                                    color2: colorGrey,
                                    color3: colorGrey,
                                    color4: colorGrey,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Welcome to",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "TEXT  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                                Text(
                                  "TEXT",
                                  style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Welcome to the Bank of The Future.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Mange and track your accounts on the go.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: _emailController,

                                  onChanged: (value) {
                                    setState(() {
                                      email = _validateEmail(value);
                                      if (email) {
                                        color1 = colorGreen;
                                      }

                                    });
                                  },
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.0)),
                                      //borderRadius:BorderRadius.all(Radius.circular(6.0),
                                      borderSide: BorderSide(
                                          width: 5, color: Colors.white),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 5),
                                    ),
                                    labelText: "Email",
                                    filled: true,
                                    fillColor: colorGrey,
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 0,
                              height: 0,
                            ),
                          ),
                          NextButton(onPressed: () {
                            if (email) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PasswordPage(),
                                  ));
                            }
                          })
                        ]),
                  )));
        }));
  }
}

//Top Shape custom CLipper beizer curve
class _TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0, size.height * 90 / 100);
    path.quadraticBezierTo(35, 75, 90, 100);
    //path.quadraticBezierTo(size.width*9/100, size.height*11/100, size.width*25/100, size.height*14/100);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

bool _validateEmail(String value) {
  bool value1;
  if (value.isEmpty) {
    // The form is empty
    value1 = false;
  }

  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(value)) {
    value1 = true;
  }

  return value1;
}
