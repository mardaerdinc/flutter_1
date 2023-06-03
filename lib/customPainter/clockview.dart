import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;

  const ClockView({super.key, required this.size});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var CenterX = size.width / 2;
    var CenterY = size.height / 2;
    var Center = Offset(CenterX, CenterY);
    var radius = min(CenterX, CenterY);
    var fillBrush = Paint()..color = Color.fromARGB(255, 7, 94, 255);
    var outlineBrush = Paint()
      ..color = Color.fromARGB(136, 34, 214, 17)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    var CenterPointBrush = Paint()..color = Color.fromARGB(255, 243, 234, 234);
    var centercenter = Paint()..color = Colors.green;
    var SecHandBrush = Paint()
      ..color = Color.fromARGB(255, 61, 58, 60)
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    var minBrush = Paint()
      ..shader = RadialGradient(
              colors: [Color.fromARGB(255, 9, 182, 110), Colors.pink])
          .createShader(Rect.fromCircle(center: Center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    var HourBrush = Paint()
      ..shader = RadialGradient(
              colors: [Color.fromARGB(255, 144, 15, 196), Colors.pink])
          .createShader(Rect.fromCircle(center: Center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawCircle(Center, radius - 40, fillBrush);
    canvas.drawCircle(Center, radius - 40, outlineBrush);

    var Sechandx = CenterX + 60 * cos(dateTime.second * 6 * pi / 100);
    var Sechandy = CenterX + 60 * sin(dateTime.second * 6 * pi / 100);
    canvas.drawLine(Center, Offset(Sechandx, Sechandy), SecHandBrush);

    var minhandx = CenterX + 80 * cos(dateTime.minute * 6 * pi / 100);
    var minhandy = CenterX + 80 * sin(dateTime.minute * 6 * pi / 100);
    canvas.drawLine(Center, Offset(minhandx, minhandy), minBrush);

    var hourhandx = CenterX +
        80 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 100);
    var hourhandy = CenterX +
        80 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 100);
    canvas.drawLine(Center, Offset(hourhandx, hourhandy), HourBrush);

    canvas.drawCircle(Center, 14, CenterPointBrush);
    canvas.drawCircle(Center, 5, centercenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
