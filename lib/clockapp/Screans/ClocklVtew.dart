import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClockView extends StatefulWidget {
  final double size;

  ClockView({Key? key, required this.size}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(
        Duration(
          seconds: 1,
        ), (timer) {
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
          painter: ClockPinter(),
        ),
      ),
    );
  }
}

class ClockPinter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    //لعمل الدائرة بنحدد ال اكس وال واي والسنتر هيا النقطة بين ال الكس والواي
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var fillbrush = Paint()..color = Color(0xFF444974); //الفرشاه
    var outlinebrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke //اعملها مفرغة من جوا
      ..strokeWidth = size.width / 20; //عرض التفريغة

    var Centerfillbush = Paint()..color = Color(0xFFEAECFF); // للنقطة الي بالنص

    var secHandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [
        Colors.purple,
        Colors.yellow,
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [
        Colors.lightBlue,
        Colors.pink,
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;
    //-------------------
    canvas.drawCircle(
        //رسمنا الدائرة الكلية
        center,
        radius * 0.75 //نفصنا الحجم تبع الدائرة ,
        ,
        fillbrush); //الدائرة نفسها بتختاج السنتر و نص القطر
    //----------------
    canvas.drawCircle(
        //رسمها الاطار الخارجي
        center,
        radius * 0.75 //نفصنا الحجم تبع الدائرة ,
        ,
        outlinebrush);
//=====================
    var secHandx = centerX + radius * 0.7 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + radius * 0.7 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandx, secHandY),
        secHandBrush); // ارسم الخط الي هوا تبع الثواني
    //----------------------
    var minHandx = centerX + radius * 0.6 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minHandx, minHandY),
        minHandBrush); // ارسم الخط الي هوا تبع الدقايق

    //----------------------
    var hourHandx = centerX +
        radius *
            0.4 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        radius *
            0.4 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    //----------------------
    canvas.drawLine(center, Offset(hourHandx, hourHandY),
        hourHandBrush); // ارسم الخط الي هوا تبع الساعات

    //---------------------
    canvas.drawCircle(
        center, 16, Centerfillbush); //ؤسم النقطة الي هيا السنتر الي بالنص
    //----------------------
    canvas.drawCircle(center, 16, Centerfillbush);
    var outerCicleRaduis = radius;
    var innerCicleRaduis = radius * 0.9;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCicleRaduis * cos(i * pi / 180);
      var y1 = centerX + outerCicleRaduis * sin(i * pi / 180);
      var x2 = centerX + innerCicleRaduis * cos(i * pi / 180);
      var y2 = centerX + innerCicleRaduis * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), Centerfillbush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
