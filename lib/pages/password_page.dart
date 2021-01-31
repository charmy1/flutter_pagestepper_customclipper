import 'package:flutter/material.dart';

import 'package:flutterappassignment1/pages/personal_info_page.dart';
import 'package:flutterappassignment1/widgets/my_inherited_progress_widget.dart';
import 'package:flutterappassignment1/widgets/my_inherited_widget.dart';
import 'package:flutterappassignment1/widgets/number_row.dart';
import 'package:flutterappassignment1/widgets/password_check.dart';

import '../widgets/next_button.dart';
import '../constants.dart';

Color color2;
var _passController = TextEditingController();
bool visible = false;
bool visibleLower = false;
bool visibleUpper = false;
bool visibleNumber = false;
bool visibleCharacter = false;

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  void initState() {
    super.initState();
    color2 = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
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
                          MyInheritedProgressWidget(
                            color1: colorGrey,
                            color2: color2,
                            color3: colorGrey,
                            color4: colorGrey,
                            child: NumberRow(
                              color1: colorGrey,
                              color2: colorGrey,
                              color3: colorGrey,
                              color4: colorGrey,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Create Password",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Password would be used to login to account",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomPassword(
                              fieldname: "Password",
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Complexity:",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              !(visibleNumber &&
                                      visibleCharacter &&
                                      visibleLower &&
                                      visibleCharacter)
                                  ? Text("Weak",
                                      style: TextStyle(color: Colors.orange))
                                  : Text("Strong",
                                      style: TextStyle(color: Colors.orange)),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              height: 0,
                            ),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Expanded(
                                child: MyInheritedWidgetPassword(
                                    visible: visibleLower,
                                    child: PasswordCheckWidget(
                                      text1: "a",
                                      text2: "Lowercase",
                                    )),
                              ),
                              Expanded(
                                child: MyInheritedWidgetPassword(
                                    visible: visibleUpper,
                                    child: PasswordCheckWidget(
                                      text1: "A",
                                      text2: "Uppercase",
                                    )),
                              ),
                              Expanded(
                                child: MyInheritedWidgetPassword(
                                    visible: visibleNumber,
                                    child: PasswordCheckWidget(
                                      text1: "123",
                                      text2: "Number",
                                    )),
                              ),
                              Expanded(
                                child: MyInheritedWidgetPassword(
                                    visible: visibleCharacter,
                                    child: PasswordCheckWidget(
                                      text1: "9+",
                                      text2: "Characters",
                                    )),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              height: 0,
                            ),
                          ),
                          NextButton(onPressed: () {
                            if (visibleCharacter &&
                                visibleLower &&
                                visibleUpper &&
                                visibleNumber) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PersonalInfoPage(),
                                  ));
                            }

                            // void refresh(dynamic childValue) {

                            // }
                          })
                        ]),
                  )));
        }));
  }
}

class CustomPassword extends StatefulWidget {
  final String fieldname;

  const CustomPassword({Key key, @required this.fieldname}) : super(key: key);

  @override
  _CustomPasswordState createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool _obscureText = true;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            visibleUpper = callRegexUpper(_passController.text);
            visibleLower = callRegexLower(_passController.text);
            visibleCharacter = callRegexWhole(_passController.text);
            visibleNumber = callRegexDigit(_passController.text);

            if (visibleCharacter &&
                visibleLower &&
                visibleUpper &&
                visibleNumber) {
              color2 = colorGreen;
            }
          });
        },
        controller: _passController,
        style: TextStyle(color: Colors.grey),
        obscureText: _obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          //hintText: fieldname,
          fillColor: Colors.white,
          filled: true,
          labelStyle: TextStyle(color: Colors.grey),
          labelText: widget.fieldname,

          suffixIcon: (_obscureText)
              ? GestureDetector(
                  child: new IconTheme(
                    data: new IconThemeData(
                        color: Theme.of(context).primaryColor),
                    child: new Icon(Icons.remove_red_eye),
                  ),
                  onTap: () {
                    setState(() {
                      _obscureText = false;
                    });
                  },
                )
              : GestureDetector(
                  child: new IconTheme(
                      data: new IconThemeData(
                          color: Theme.of(context).primaryColor),
                      child: new Icon(Icons.remove_red_eye)),
                  onTap: () {
                    setState(() {
                      _obscureText = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}

callRegexUpper(String value) {
  RegExp regExpUpper = new RegExp(
    r"(?=.*[A-Z])",
    caseSensitive: true,
    multiLine: false,
  );
  print("allMatches upper: " + regExpUpper.hasMatch(value).toString());

  return regExpUpper.hasMatch(value);
}

callRegexLower(String value) {
  RegExp regExpLower = new RegExp(
    r"(?=.*[a-z])",
    caseSensitive: true,
    multiLine: false,
  );
  print("allMatches lower: " + regExpLower.hasMatch(value).toString());
  return regExpLower.hasMatch(value);
}

callRegexDigit(String value) {
  RegExp regExpDigit = new RegExp(
    r"(?=.*[0-9])",
    caseSensitive: true,
    multiLine: false,
  );
  print("allMatches digit: " + regExpDigit.hasMatch(value).toString());
  return regExpDigit.hasMatch(value);
}

callRegexWhole(String value) {
  RegExp regExpWhole = new RegExp(
    r"(?=.*[a-zA-Z0-9]{9,})",
    caseSensitive: true,
    multiLine: false,
  );
  print("allMatches whole: " + regExpWhole.hasMatch(value).toString());
  return regExpWhole.hasMatch(value);
}
