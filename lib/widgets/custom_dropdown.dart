import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {


  final String label;
  final TextEditingController ed;

  final ValueChanged<String> onChanged;
  const CustomDropDown({Key key, this.label, this.ed, this.onChanged}) : super(key: key);
  @override
  _CustomDropDownState createState() =>
      _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String _currentSelectedValue1;
  var _optionsList = [
    "-Choose Option-",
    "Option1",
    "Option2",
    "Option3",
  ];
  @override
  void initState() {
    widget.ed.text= _optionsList[0];
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {

          return InputDecorator(

            decoration: InputDecoration(
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
            isEmpty: _currentSelectedValue1 == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Image.asset('lib/assets/drop_down_arrow.png'),
                value: widget.ed.text,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                   widget.ed.text = newValue;
                    state.didChange(newValue);
                  });
                },
                items: _optionsList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
