import 'package:flutter/material.dart';

// class SliderProvider extends ChangeNotifier {
//   double _sliderValue = 100;
//
//   double get sliderValue => _sliderValue;
//
//   void getValue(double value) {
//     _sliderValue = value;
//     notifyListeners();
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: RotatedBox(quarterTurns: 1, child: SliderWidget()),
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });
  final double thumbRadius;
  final int min;
  final int max;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    TextPainter? labelPainter,
    RenderBox? parentBox,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    required double value,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF00c6ff),
          Color(0xFF0072ff),
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset.fromDirection(0, 1),
          radius: 1,
        ),
      );

    final paintBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawCircle(center, thumbRadius * .9, paint);
    canvas.drawCircle(center, thumbRadius * .9, paintBorder);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget(
      {this.sliderHeight = 48,
      this.max = 10,
      this.min = 0,
      this.fullWidth = false});
  final double sliderHeight;
  final int min;
  final int max;
  final bool fullWidth;

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    var paddingFactor = 0.2;

    if (widget.fullWidth) paddingFactor = .3;

    return Container(
      width: widget.fullWidth ? double.infinity : (widget.sliderHeight) * 5.5,
      height: widget.sliderHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(widget.sliderHeight * .3),
        ),
        gradient: const LinearGradient(
            colors: [
              Color(0xFF00c6ff),
              Color(0xFF0072ff),
            ],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 1),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(widget.sliderHeight * paddingFactor, 2,
            widget.sliderHeight * paddingFactor, 2),
        child: Row(
          children: <Widget>[
            /// Optional Text for min value
            Text(
              '${widget.min}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: widget.sliderHeight * .1,
            ),
            Expanded(
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    /// Color of the active track - left of the thumb slider
                    activeTrackColor: Colors.white.withOpacity(1),

                    /// Color of the inactive track - right of the thumb slider
                    inactiveTrackColor: Colors.white.withOpacity(1),

                    /// Track height
                    trackHeight: 10,
                    thumbShape: CustomSliderThumbCircle(
                      thumbRadius: widget.sliderHeight * .3,
                      min: widget.min,
                      max: widget.max,
                    ),
                    overlayColor: Colors.white.withOpacity(.4),
                    //valueIndicatorColor: Colors.white,
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                ),
              ),
            ),
            SizedBox(
              width: widget.sliderHeight * .1,
            ),

            /// Optional Text for max value
            Text(
              '${widget.max}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
