import 'package:flutter/material.dart';

import '../constants.dart';
//import 'file:///D:/FLutter%20FL%20Work/Persistent%20P/flutter_app_assignment1/lib/constants.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({Key key, this.onPressed}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: onPressed,
              color: buttonColor,
              child: Text("Next",style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ],
    );
  }
}
