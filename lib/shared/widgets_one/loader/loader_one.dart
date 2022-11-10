import 'dart:math';

import 'package:flutter/material.dart';

class LoaderOne extends StatefulWidget {
  const LoaderOne({super.key, this.radius = 30.0, this.dotRadius = 3.0});
  final double radius;
  final double dotRadius;

  @override
  _LoaderOneState createState() => _LoaderOneState();
}

class _LoaderOneState extends State<LoaderOne>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;
  late AnimationController controller;

  late double radius;
  late double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    print(dotRadius);

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = widget.radius * animation_radius_in.value;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = widget.radius * animation_radius_out.value;
        }
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Center(
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: const Offset(0.0, 0.0),
                  child: _dot(
                    radius: radius,
                    color: Colors.black12,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0),
                    radius * sin(0.0),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.amber,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0 + 1 * pi / 4),
                    radius * sin(0.0 + 1 * pi / 4),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0 + 2 * pi / 4),
                    radius * sin(0.0 + 2 * pi / 4),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.pinkAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0 + 3 * pi / 4),
                    radius * sin(0.0 + 3 * pi / 4),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.purple,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0 + 4 * pi / 4),
                    radius * sin(0.0 + 4 * pi / 4),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.yellow,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0 + 5 * pi / 4),
                    radius * sin(0.0 + 5 * pi / 4),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.lightGreen,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0 + 6 * pi / 4),
                    radius * sin(0.0 + 6 * pi / 4),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.orangeAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    radius * cos(0.0 + 7 * pi / 4),
                    radius * sin(0.0 + 7 * pi / 4),
                  ),
                  child: _dot(
                    radius: dotRadius,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget _dot({double? radius, Color? color}) {
    return Center(
        child: Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ));
  }
}

// class Dot extends StatelessWidget {
//   const Dot({super.key, this.radius, this.color});
//   final double? radius;
//   final Color? color;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: radius,
//         height: radius,
//         decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       ),
//     );
//   }
// }
