import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@hosivay',
      home: SpinWheelScreen(),
    );
  }
}

class SpinWheelScreen extends StatefulWidget {
  @override
  _SpinWheelScreenState createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> {
  final _items = [
    const FortuneItem(
        child: Text(
          'Item 1',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        style: FortuneItemStyle(color: Colors.red)),
    const FortuneItem(
        child: Text(
          'Item 2',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        style: FortuneItemStyle(color: Colors.blue)),
    const FortuneItem(
        child: Text(
          'Item 3',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        style: FortuneItemStyle(color: Colors.green)),
    const FortuneItem(
        child: Text(
          'Item 4',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        style: FortuneItemStyle(color: Colors.yellow)),
    const FortuneItem(
        child: Text(
          'Item 5',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        style: FortuneItemStyle(color: Colors.orange)),
  ];

  final StreamController<int> _controller = StreamController<int>();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('@hosivay'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  final int randomNumber = Random().nextInt(_items.length);
                  _controller.sink.add(randomNumber);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FortuneWheel(
                    items: _items,
                    animateFirst: false,
                    rotationCount: _items.length,
                    duration: const Duration(seconds: 3),
                    onAnimationEnd: () {
                      print('Wheel stopped spinning');
                    },
                    selected: _controller.stream,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: () {
                  final int randomNumber = Random().nextInt(_items.length);
                  _controller.sink.add(randomNumber);
                },
                child: const Text('Spin'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
