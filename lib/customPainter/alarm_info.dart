import 'package:flutter/material.dart';
import 'dart:convert';

class AlarmInfo {
  DateTime alarmDateTime;
  String description;
  bool isActive;
  List<Color> gradientColors;

  AlarmInfo({
    required this.alarmDateTime,
    required this.description,
    required this.isActive,
    required this.gradientColors,
  });
  Map<String, dynamic> toMap() {
    return {
      'alarmDateTime': alarmDateTime.toString(),
      'description': description,
      'isActive': isActive ? 1 : 0,
      'gradientColors': gradientColors.map((c) => c.value).toList(),
    };
  }

  factory AlarmInfo.fromJson(Map<String, dynamic> json) => AlarmInfo(
        alarmDateTime: json["alarmDateTime"],
        description: json["description"],
        isActive: json["isActive"],
        gradientColors: json["gradientColors"],
      );

  Map<String, dynamic> toJson() => {
        "alarmDateTime": alarmDateTime,
        "description": description,
        "isActive": isActive,
        "gradientColors": gradientColors,
      };
}
