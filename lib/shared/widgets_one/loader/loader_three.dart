import 'dart:math';

import 'package:flutter/material.dart';

class LoaderThree extends StatefulWidget {
  const LoaderThree({
    super.key,
    this.color1 = Colors.deepOrangeAccent,
    this.color2 = Colors.yellow,
    this.color3 = Colors.lightGreen,
  });
  final Color color1;
  final Color color2;
  final Color color3;
  //final double radius2, radius3;

  @override
  _LoaderThreeState createState() => _LoaderThreeState();
}

class _LoaderThreeState extends State<LoaderThree>
    with TickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);

    controller2 = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);

    controller3 = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    animation1 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller1,
        curve: const Interval(0, 1, curve: Curves.linear)));

    animation2 = Tween<double>(begin: -1, end: 0).animate(CurvedAnimation(
        parent: controller2,
        curve: const Interval(0, 1, curve: Curves.easeIn)));

    animation3 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller3,
        curve: const Interval(0, 1, curve: Curves.decelerate)));

    controller1.repeat();
    controller2.repeat();
    controller3.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: <Widget>[
            // RotationTransition(
            //   turns: animation1,
            //   child: CustomPaint(
            //     painter: Arc1Painter(widget.color1),
            //     child: const SizedBox(
            //       width: 50,
            //       height: 50,
            //     ),
            //   ),
            // ),
            RotationTransition(
              turns: animation2,
              child: CustomPaint(
                painter: Arc2Painter(widget.color2),
                child: Container(
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            RotationTransition(
              turns: animation3,
              child: CustomPaint(
                painter: Arc3Painter(widget.color3),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }
}

class Arc1Painter extends CustomPainter {
  Arc1Painter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final rect1 = Rect.fromLTWH(0.0, 0.0, size.width, size.height);

    canvas.drawArc(rect1, 0.0, 0.5 * pi, false, p1);
    canvas.drawArc(rect1, 0.6 * pi, 0.8 * pi, false, p1);
    canvas.drawArc(rect1, 1.5 * pi, 0.4 * pi, false, p1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Arc2Painter extends CustomPainter {
  Arc2Painter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p2 = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final rect2 = Rect.fromLTWH(
        0.0 + (0.3 * size.width) / 2,
        0.0 + (0.3 * size.height) / 2,
        size.width - 0.3 * size.width,
        size.height - 0.3 * size.height);

    canvas.drawArc(rect2, 0.0, 0.5 * pi, false, p2);
    canvas.drawArc(rect2, 0.8 * pi, 0.6 * pi, false, p2);
    canvas.drawArc(rect2, 1.6 * pi, 0.2 * pi, false, p2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Arc3Painter extends CustomPainter {
  Arc3Painter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p3 = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final rect3 = Rect.fromLTWH(
        0.0 + (0.6 * size.width) / 2,
        0.0 + (0.6 * size.height) / 2,
        size.width - 0.6 * size.width,
        size.height - 0.6 * size.height);

    canvas.drawArc(rect3, 0.0, 0.5 * pi, false, p3);
    canvas.drawArc(rect3, 0.8 * pi, 0.6 * pi, false, p3);
    canvas.drawArc(rect3, 1.6 * pi, 0.2 * pi, false, p3);

    // canvas.drawArc(rect3, 0.5, .9 * pi, false, p3);
    // canvas.drawArc(rect3, .8 * pi, 0.7 * pi, false, p3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
