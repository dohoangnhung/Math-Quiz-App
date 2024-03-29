import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:lottie/lottie.dart';
import 'package:math_quiz/game1_screens/game1_screen.dart';

class Game1ReadyScreen extends StatefulWidget {
  const Game1ReadyScreen({super.key});

  @override
  State<Game1ReadyScreen> createState() => _ReadyDialogState();
}

class _ReadyDialogState extends State<Game1ReadyScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5430), () {
      Get.to(() => const Game1Screen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/night-sky.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/ready.json',
                  repeat: false,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Bạn đã sẵn sàng?',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  isRepeatingAnimation: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
