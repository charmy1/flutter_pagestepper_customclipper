import 'package:flutter/material.dart';
class MyInheritedProgressWidget extends InheritedWidget {
  // final bool visible;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;


  MyInheritedProgressWidget({this.color1, this.color2, this.color3, this.color4,
    Key key,

    @required Widget child,
  }) : super(key: key, child: child);

  static MyInheritedProgressWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: MyInheritedProgressWidget);
  }

  @override
  bool updateShouldNotify(MyInheritedProgressWidget oldWidget) {
   return  (color1 != oldWidget.color1) || (color2 != oldWidget.color2) || (color3 != oldWidget.color3) || (color4 != oldWidget.color4) ;

  }
}