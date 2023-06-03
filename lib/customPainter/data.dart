import 'package:flutter_1/customPainter/alarm_info.dart';
import 'package:flutter_1/customPainter/enum.dart';

import 'package:flutter_1/customPainter/menuinfo.dart';
import 'package:flutter_1/customPainter/theme.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: "Clock", ImageSource: 'clock'),
  MenuInfo(MenuType.alarm, title: "Alarm", ImageSource: 'alarmm'),
  MenuInfo(MenuType.timer, title: "Timer", ImageSource: 'timer'),
  MenuInfo(MenuType.stopwatch, title: "Stopwatch", ImageSource: 'stopwatch'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      isActive: true,
      alarmDateTime: DateTime.now().add(Duration(
        hours: 1,
      )),
      description: "office",
      gradientColors: GradientColors.sky),
  AlarmInfo(
      isActive: true,
      alarmDateTime: DateTime.now().add(Duration(
        hours: 2,
      )),
      description: "Sporrt",
      gradientColors: GradientColors.sunset),
];
