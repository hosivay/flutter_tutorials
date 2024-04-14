import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Wavetest());
}

class Wavetest extends StatelessWidget {
  const Wavetest({super.key});

  @override
  Widget build(BuildContext context) {
//IG : @hosivay
//Site : FlutterZone.ir
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange.shade700,
        body: Stack(
          children: [
            const Positioned(
              bottom: 55,
              top: 0,
              left: 150,
              right: 150,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.yellow,
              ),
            ),
            WaveWidget(
              config: CustomConfig(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
                durations: [
                  5000,
                  4000,
                ],
                heightPercentages: [
                  0.38,
                  0.4,
                ],
              ),
              size: const Size(double.infinity, double.infinity),
              waveAmplitude: 0,
            ),
          ],
        ),
      ),
    );
  }
}
