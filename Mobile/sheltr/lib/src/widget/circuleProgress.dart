import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class CircleProgressCustom extends StatefulWidget {
  final double begin;
  final double end;
  final double width;
  final double height;
  final double outerCircleWidth;
  final double completeArcWidth;
  final double fontSize;

  CircleProgressCustom(
      {this.begin = 0,
      this.end = 100,
      this.height = 80.0,
      this.width = 80.0,
      this.outerCircleWidth = 5.0,
      this.completeArcWidth = 5.0,
      this.fontSize = 10.0});

  @override
  _CircleProgressCustomState createState() => _CircleProgressCustomState();
}

class _CircleProgressCustomState extends State<CircleProgressCustom>
    with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(progressController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: CustomPaint(
            foregroundPainter: CircleProgress(
                currentProgress: animation.value,
                outerCircleWidth: widget.outerCircleWidth,
                completeArcWidth: widget
                    .completeArcWidth), // this will add custom painter after child
            child: Container(
              width: widget.width,
              height: widget.height,
              child: GestureDetector(
                  onTap: () {
                    if (animation.value == widget.end) {
                      progressController.reverse();
                    } else {
                      progressController.forward();
                    }
                  },
                  child: Center(
                      child: Text(
                    "${animation.value.toInt()} %",
                    style: TextStyle(
                        fontSize: widget.fontSize,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          ),
        )
      ],
    );
  }
}

class CircleProgress extends CustomPainter {
  double currentProgress;
  double outerCircleWidth;
  double completeArcWidth;

  CircleProgress(
      {this.currentProgress, this.outerCircleWidth, this.completeArcWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = this.outerCircleWidth
      ..color = Colors.blue[200]
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = this.completeArcWidth
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
