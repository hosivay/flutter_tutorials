import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: MyEnvelope(
              title: "!ضربه بزن تا نامه باز بشه",
              content:
                  "سلامممم خوبی؟ امیدوارم از ویدیو لذت برده باشی و چیزی یاد گرفته باشی \n\nممنون میشم ویدیو رو لایک کنی و منو فالو کنی \nHosivay@ ",
              icon: Icons.code,
              color: Colors.cyan.shade800)),
    );
  }
}

class MyEnvelope extends StatefulWidget {
  const MyEnvelope(
      {super.key,
      required this.title,
      required this.content,
      required this.icon,
      required this.color});
  final String title, content;
  final IconData icon;
  final Color? color;
  @override
  State<MyEnvelope> createState() => _MyEnvelopeState();
}

class _MyEnvelopeState extends State<MyEnvelope> {
  var padding = 150.0;
  var bottomPadding = 0.0;
  //instagram : @hosivay
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          child: GestureDetector(
            onTap: () {
              setState(() {
                padding = padding == 0 ? 150.0 : 0.0;
                bottomPadding = bottomPadding == 0 ? 150 : 0.0;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              height: 220,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: widget.color!.withOpacity(0.2), blurRadius: 25),
                ],
                color: widget.color!.withOpacity(1.0),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.content,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
            height: 180,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 30)
              ],
              color: Colors.grey.shade200.withOpacity(1.0),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Center(
                child: Icon(widget.icon, //CupertinoIcons.money_dollar_circle,
                    color: widget.color!,
                    size: 70)),
          ),
        ),
      ],
    );
  }
}
