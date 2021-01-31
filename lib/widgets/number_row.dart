import 'package:flutter/material.dart';

import 'my_inherited_progress_widget.dart';

//Number Row widget
//change color of the number circle by passing parameter in constructor
class NumberRow extends StatefulWidget {
  final Color color1, color2, color3, color4;

  const NumberRow({Key key, this.color1, this.color2, this.color3, this.color4})
      : super(key: key);

  @override
  _NumberRowState createState() => _NumberRowState();
}

class _NumberRowState extends State<NumberRow> {
  @override
  void initState() {
    super.initState();
    //color1=Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final MyInheritedProgressWidget inheritedWidget = MyInheritedProgressWidget.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: inheritedWidget.color1,
            child: Text(
              '1',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Container(
              child: Divider(
                color: Colors.black,
                height: 40,
                thickness: 5,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: inheritedWidget.color2,
            child: Text(
              '2',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Container(
              child: Divider(
                color: Colors.black,
                height: 40,
                thickness: 5,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: inheritedWidget.color3,
            child: Text(
              '3',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Container(
              child: Divider(
                color: Colors.black,
                height: 40,
                thickness: 5,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: inheritedWidget.color4,
            child: Text(
              '4',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
