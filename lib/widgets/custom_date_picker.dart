import 'package:flutter/material.dart';
class CustomDatePicker extends StatefulWidget {
  final String label;
  final String icon;
  final String disabledIcon;

  const CustomDatePicker({Key key, this.label, this.icon, this.disabledIcon})
      : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate;
  TextEditingController dateCtl = TextEditingController();
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    selectedDate = DateTime.now();
    // dateCtl.text = DateTime.now().toIso8601String();
    //  final f = new DateFormat('dd/MM/yyyy');
    dateCtl.text = "- Choose Date -";

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

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(
              //  primarySwatch:  Colors.black,
              //   colorScheme: ColorScheme.light(primary: const Color(0xFF000000)),

              // buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary,),
              //primaryColor: Colors.black, //Head background

              //accentColor: Colors.black //selection color

              //dialogBackgroundColor: Colors.white,//Background color
            ),
            child: child,
          );
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        // dateCtl.text = picked.toIso8601String();

        // final f = new DateFormat('dd-MM-yyyy');
        dateCtl.text = picked.toLocal().day.toString() +
            "-" +
            picked.toLocal().toUtc().month.toString() +
            "-" +
            picked.toLocal().toUtc().year.toString();
        //f.format(picked);
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
          _selectDate(context);
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
