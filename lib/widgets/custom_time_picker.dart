import 'package:flutter/material.dart';


class CustomTimePicker extends StatefulWidget {
  final String label;
  final String icon;
  final String disabledIcon;

  const CustomTimePicker({Key key, this.label, this.icon, this.disabledIcon})
      : super(key: key);

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay time;
  TextEditingController dateCtl = TextEditingController();
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    time = TimeOfDay.now();
    // dateCtl.text = DateTime.now().toIso8601String();
    //  final f = new DateFormat('dd/MM/yyyy');
    dateCtl.text = "- Choose Time -";

    /* f.format(DateTime.now());*/
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  // DateTime selectedDate = DateTime.now();

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        //time = t;

        dateCtl.text=t.hour.toString()+":"+t.minute.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        cursorColor: Colors.transparent,
        readOnly: true,
        onTap: () async {
          _requestFocus();
          _pickTime();
        },
        controller: dateCtl,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.keyboard_arrow_down),
          filled: true,
          fillColor: Colors.white,

          labelStyle: TextStyle(
            //   fontSize: 12,
              fontWeight: FontWeight.w500,
              // height: 1.5,
              color: Colors.grey,
              letterSpacing: 0.2),
          labelText: widget.label,
          //  floatingLabelBehavior: FloatingLabelBehavior.always,
          //  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
        ),
      ),
    );
  }
}
