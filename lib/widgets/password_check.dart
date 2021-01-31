import 'package:flutter/material.dart';
import 'package:flutterappassignment1/constants.dart';

import 'my_inherited_widget.dart';

class PasswordCheckWidget extends StatefulWidget {
  final String text1;
  final String text2;
  final Function() notifyParent;

  const PasswordCheckWidget(
      {Key key, this.text1, this.text2, this.notifyParent})
      : super(key: key);

  @override
  _PasswordCheckWidgetState createState() => _PasswordCheckWidgetState();
}

class _PasswordCheckWidgetState extends State<PasswordCheckWidget> {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetPassword inheritedWidget = MyInheritedWidgetPassword.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 30,
              width: 40,
              child: !inheritedWidget.visible
                  ? Text(
                      widget.text1,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  : ClipOval(
                child: Material(
                  color: colorGreen, // button color
                  child: InkWell(
                   // splashColor: Colors.red, // inkwell color
                    child: SizedBox(width: 60, height: 60, child: new IconTheme(
                      data: new IconThemeData(
                          color: Colors.white),
                      child: new Icon(Icons.check),
                    ),)),
                    //onTap: () {},
                  ),
                ),
              ),



            Text(
              widget.text2,
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ],
    );
  }
}
