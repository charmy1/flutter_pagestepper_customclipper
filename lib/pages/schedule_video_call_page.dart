import 'package:flutter/material.dart';
import 'package:flutterappassignment1/widgets/custom_date_picker.dart';
import 'package:flutterappassignment1/widgets/custom_time_picker.dart';
import 'package:flutterappassignment1/widgets/my_inherited_progress_widget.dart';

import '../constants.dart';
import '../widgets/next_button.dart';
import '../widgets/number_row.dart';

class ScheduleVideoCallPage extends StatefulWidget {
  @override
  _ScheduleVideoCallPageState createState() => _ScheduleVideoCallPageState();
}

class _ScheduleVideoCallPageState extends State<ScheduleVideoCallPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Color color4;

  @override
  void initState() {
    super.initState();

    color4 = Colors.white;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
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
                              color3: Colors.white,
                              color4: color4,
                              child: NumberRow(
                                color1: Colors.white,
                                color2: Colors.white,
                                color3: colorGreen,
                                color4: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 70,
                                    child: AnimatedBuilder(
                                      animation: animationController,
                                      builder: (context, child) {
                                        return Container(
                                          decoration: ShapeDecoration(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            shape: CircleBorder(),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0 *
                                                animationController.value),
                                            child: child,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: CircleBorder(),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          color: Colors.blue,
                                          icon: Icon(Icons.calendar_today,
                                              size: 24),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Schedule Video Call",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Choose the date and time that you prefer,we will send a link via email to make a video call on the scheduled data and time",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  CustomDatePicker(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomTimePicker()
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
                        setState(() {
                          color4 = colorGreen;
                        });
                      }
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleVideoCallPage(),)),
                          )
                    ]),
                  )));
        }));
  }
}
