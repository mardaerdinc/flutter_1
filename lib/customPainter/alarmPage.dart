import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/customPainter/data.dart';
import 'package:flutter_1/customPainter/alarm_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Alarm",
            style: TextStyle(
                fontFamily: "avenir",
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
                fontSize: 24),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>(
                (alarm) {
                  var alarmTime =
                      DateFormat('hh:mm aa ').format(alarm.alarmDateTime);
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: alarm.gradientColors,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: alarm.gradientColors.last.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(4, 4))
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(23, 23),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.label,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "office",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Switch(
                                onChanged: (bool value) {},
                                value: true,
                                activeColor: Colors.white,
                              )
                            ],
                          ),
                          Text(
                            "Mon_Fri",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "07:00 AM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ).followedBy([
                if (alarms.length < 5)
                  DottedBorder(
                    strokeWidth: 3,
                    color: Colors.black87,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(24),
                    dashPattern: [5, 4],
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 16, 7, 92),
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.red,
                              size: 30,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "add Alarm",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  Text('only 5 alarm allowed')
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
