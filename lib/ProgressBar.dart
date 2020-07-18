import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleProgressBar extends StatefulWidget{
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;

  CircleProgressBar({
    Key key,
    this.backgroundColor,
    @required this.foregroundColor,
    @required this.value,
    }) : super(key: key);

  _CircleProgressBarState createState() => _CircleProgressBarState(
    foregroundColor: this.foregroundColor,
    value: this.value
  );
}

class _CircleProgressBarState extends State<CircleProgressBar> with SingleTickerProviderStateMixin {
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;
  static Animation<double> anime;
  static AnimationController animeCont;

  @override
  void initState(){
    super.initState();

    animeCont = AnimationController(duration: Duration(minutes: 1), vsync: this);
    anime = Tween<double>(begin: 0, end: 0.5).animate(animeCont)..addListener(() { 
      setState(() {
        print(2 * Math.pi * anime.value);
      });
    });

    animeCont.forward();
  }

  _CircleProgressBarState({
    this.backgroundColor,
    @required this.foregroundColor,
    @required this.value,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor;
    final foregroundColor = this.foregroundColor;
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: Container(),
        foregroundPainter: CircleProgressBarPainter(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          percentage: anime.value,
        ),
      ),
    );
  }
}

// Draws the progress bar.
class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;

  CircleProgressBarPainter({
    this.backgroundColor,
    @required this.foregroundColor,
    @required this.percentage,
    double strokeWidth,
  }) : this.strokeWidth = strokeWidth ?? 6;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final Size constrainedSize = size - Offset(this.strokeWidth, this.strokeWidth);
    final shortestSide = Math.min(constrainedSize.width, constrainedSize.height);
    final foregroundPaint = Paint()
    ..shader = LinearGradient(colors: [Colors.black, Colors.blue, Colors.deepPurple]).createShader(Rect.fromCircle(center: center, radius: shortestSide / 2))
      ..color = this.foregroundColor
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final radius = (shortestSide / 2);

    // Start at the top. 0 radians represents the right edge
    final double startAngle = -(2 * Math.pi * 0.25);
    final double sweepAngle = (2 * Math.pi * (this.percentage ?? 0));

    // Don't draw the background if we don't have a background color
    if (this.backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = this.backgroundColor
        ..strokeWidth = 30
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.percentage != this.percentage ||
        oldPainter.backgroundColor != this.backgroundColor ||
        oldPainter.foregroundColor != this.foregroundColor ||
        oldPainter.strokeWidth != this.strokeWidth;
  }
}