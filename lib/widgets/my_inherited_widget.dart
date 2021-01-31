import 'package:flutter/material.dart';
class MyInheritedWidgetPassword extends InheritedWidget {
 // final bool visible;
 final bool visible ;
  final bool visibleLower;
  final bool visibleUpper;
  final bool visibleNumber;
  final bool visibleCharacter;


  MyInheritedWidgetPassword({this.visibleLower, this.visibleUpper, this.visibleNumber, this.visibleCharacter,
    Key key,
     this.visible,
    @required Widget child,
  }) : super(key: key, child: child);

  static MyInheritedWidgetPassword of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: MyInheritedWidgetPassword);
  }

  @override
  bool updateShouldNotify(MyInheritedWidgetPassword oldWidget) =>
      visible != oldWidget.visible;
}