import 'package:flutter/material.dart';
import 'package:flutterappassignment1/pages/schedule_video_call_page.dart';
import 'package:flutterappassignment1/widgets/my_inherited_progress_widget.dart';

import '../constants.dart';
import '../widgets/next_button.dart';
import '../widgets/number_row.dart';
import '../widgets/custom_dropdown.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  Color color3;
  TextEditingController goal = TextEditingController();
  TextEditingController income = TextEditingController();
  TextEditingController expense = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color3 = Colors.white;
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
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyInheritedProgressWidget(
                              color1: Colors.white,
                              color2: Colors.white,
                              color3: color3,
                              color4: Colors.white,
                              child: NumberRow(
                                color1: Colors.white,
                                color2: Colors.white,
                                color3: color3,
                                color4: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Personal Information",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Please fill in the information below and your goal for digital saving",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  CustomDropDown(
                                    label: "Goal for activation",
                                    ed: goal,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        goal.text = newValue;
                                        if(notEmptyValidation())
                                          {
                                            setState(() {
                                              color3 = colorGreen;
                                            });
                                          }
                                        //state.didChange(newValue);
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomDropDown(
                                    label: "Monthly income",
                                    ed: income,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        income.text = newValue;
                                       if( notEmptyValidation()){
                                         setState(() {
                                           color3 = colorGreen;
                                         });
                                       }
                                        //state.didChange(newValue);
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  CustomDropDown(
                                    label: "Monthly expense",
                                    ed: expense,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        expense.text = newValue;
                                        if(notEmptyValidation())
                                          {
                                            setState(() {
                                              color3 = colorGreen;
                                            });
                                          }
                                        //state.didChange(newValue);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ]),
                      Expanded(
                        child: Container(
                          height: 0,
                        ),
                      ),
                      NextButton(onPressed: () {
                        if (notEmptyValidation()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScheduleVideoCallPage(),
                              ));
                        }
                      })
                    ]),
                  )));
        }));
  }

  notEmptyValidation() {
    bool value;
    if ((goal.text == "-Choose Option-") ||
        (income.text == "-Choose Option-") ||
        (expense.text == "-Choose Option-")) {
      value = false;
    } else {

      value = true;
    }

    return value;
  }
}
