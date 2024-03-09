import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppleAnimation());
}

class AppleAnimation extends StatefulWidget {
  @override
  _AppleAnimationState createState() => _AppleAnimationState();
}

class _AppleAnimationState extends State<AppleAnimation> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.network(
                    "https://www.shutterstock.com/image-vector/apple-orchard-basket-apples-landscape-600nw-331165919.jpg",fit: BoxFit.fill)),
            
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isTapped = !isTapped;
                      });
                    },
                    child: AnimatedContainer(
                        margin: EdgeInsets.only(bottom: isTapped ? 0 : 400),
                        duration: const Duration(seconds: 1),
                        curve: isTapped ? Curves.bounceOut : Curves.ease,
                        child: Image.network("https://static.vecteezy.com/system/resources/previews/015/100/030/original/apple-transparent-background-free-png.png",width: 150,height: 150)),
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
