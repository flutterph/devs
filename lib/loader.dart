//loader
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animationHeart;
  Animation<double> animationRotation;
  Animation<double> animationRadiusIn;
  Animation<double> animationRadiusOut;

  final double initialRadius = 50.0;
  double radius = 0.0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3500),
    );

    animationHeart = Tween<double>(begin: 0.0, end: 1.25)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));

    animationRotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animationRadiusIn = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));

    animationRadiusOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animationRadiusIn.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animationRadiusOut.value * initialRadius;
        }
      });
    });

    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Opacity(
                opacity: .30,
                child: SpinKitRipple(
                  color: Colors.blueAccent,
                  size: 100.0,
                  // controller: AnimationController(
                  // vsync: this, duration: const Duration(milliseconds: 1400)),
                ),
              ),
            ),
            Align(
              child: ScaleTransition(
                scale: animationHeart,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            RotationTransition(
              turns: animationRotation,
              child: Stack(
                children: <Widget>[
                  // Dot(30, Colors.black12),

                  Transform.translate(
                    offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                    child: Dot(5.0, Colors.blue[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot(this.radius, this.color);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: this.radius,
          height: this.radius,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          )),
    );
  }
}
