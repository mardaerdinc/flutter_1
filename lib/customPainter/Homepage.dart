import 'package:flutter/material.dart';
import 'package:flutter_1/customPainter/ClockPage.dart';
import 'package:flutter_1/customPainter/alarmPage.dart';
import 'package:flutter_1/customPainter/clockview.dart';
import 'package:flutter_1/customPainter/enum.dart';
import 'package:flutter_1/customPainter/menuinfo.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_1/customPainter/data.dart';

class CustomPHomepage extends StatefulWidget {
  const CustomPHomepage({super.key});

  @override
  State<CustomPHomepage> createState() => _CustomPHomepageState();
}

class _CustomPHomepageState extends State<CustomPHomepage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM  ').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList(),
            ),
            VerticalDivider(
              color: Colors.white,
              width: 1,
            ),
            Expanded(
              child: Consumer<MenuInfo>(
                builder: (BuildContext context, value, Widget? child) {
                  if (value.menuType == MenuType.clock) {
                    return ClockPage();
                  } else if (value.menuType == MenuType.alarm) {
                    return AlarmPage();
                  } else {
                    /*  return Container(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              text: "arda",
                            ),
                            TextSpan(
                                text: value.title,
                                style: TextStyle(fontSize: 40))
                          ],
                        ),
                      ),
                    );*/

                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                      alignment: Alignment.center,
                      color: Color.fromARGB(255, 30, 25, 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Text(
                              "Clock",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formattedTime,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 64),
                                ),
                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Align(
                              alignment: Alignment.center,
                              child: ClockView(size: 250),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Timezone",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.language,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "UTC" + offsetSign + timezoneString,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {

    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return TextButton(
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
             menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              if (currentMenuInfo.ImageSource == 'clock')
                Icon(
                  Icons.timer_10_outlined,
                  size: 40,
                ),
              if (currentMenuInfo.ImageSource == 'alarmm')
                Icon(
                  Icons.alarm_add_outlined,
                  size: 40,
                ),
              if (currentMenuInfo.ImageSource == 'timer')
                Icon(
                  Icons.timer,
                  size: 40,
                ),
              if (currentMenuInfo.ImageSource == 'stopwatch')
                Icon(
                  Icons.timelapse_sharp,
                  size: 40,
                ),
              // FlutterLogo(),
              Text(
                currentMenuInfo.title ?? " ",
                style: TextStyle(color: Color.fromARGB(255, 1, 2, 66)),
              )
            ],
          ),
        );
      },
    );
  }
}
