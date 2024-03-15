import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const MyCustomWidget());
}

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "@Hosivay",
      debugShowCheckedModeBanner: false,
      home: CloudAnimation(),
    );
  }
}

class CloudAnimation extends StatefulWidget {
  @override
  _CloudAnimationState createState() => _CloudAnimationState();
}

class _CloudAnimationState extends State<CloudAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var _dragAlignment = Alignment.center;

  late Animation<Alignment> _animation;

  final _spring = const SpringDescription(
    mass: 7,
    stiffness: 1200,
    damping: 0.7,
  );

  double _normalizeVelocity(Offset velocity, Size size) {
    final normalizedVelocity = Offset(
      velocity.dx / size.width,
      velocity.dy / size.height,
    );
    return -normalizedVelocity.distance;
  }

  void _runAnimation(Offset velocity, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    final simulation =
        SpringSimulation(_spring, 0.0, 1.0, _normalizeVelocity(velocity, size));

    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() => setState(() => _dragAlignment = _animation.value));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: GestureDetector(
          onPanStart: (details) => _controller.stop(canceled: true),
          onPanUpdate: (details) => setState(
            () => _dragAlignment += Alignment(
              details.delta.dx / (MediaQuery.sizeOf(context).width / 2),
              details.delta.dy / (MediaQuery.sizeOf(context).height / 2),
            ),
          ),
          onPanEnd: (details) => _runAnimation(
              details.velocity.pixelsPerSecond, MediaQuery.sizeOf(context)),
          child: Align(
            alignment: _dragAlignment,
            child: Image.network(
                "https://static.vecteezy.com/system/resources/thumbnails/009/301/040/small/white-cloud-clipart-design-illustration-free-png.png"),
          ),
        ));
  }
}
