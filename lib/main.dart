import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_practice/animationEnum/animation_enum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RiveAnimationController controller;

  //自前のSendAnimationクラスをインスタンス化
  final SendAnimation sendAnimation = SendAnimation();

  @override
  void initState() {
    super.initState();
    controller = sendAnimation.getController();
  }

  _changeAnimation() {
    setState(() {
      sendAnimation.changeAnimation();
      controller = sendAnimation.getController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 116,
              width: 300,
              child: InkWell(
                child: RiveAnimation.asset(
                  'assets/send.riv',
                  controllers: [controller],
                ),
                onTap: () => _changeAnimation(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
