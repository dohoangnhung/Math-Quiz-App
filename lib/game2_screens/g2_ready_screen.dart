import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

import 'game2_screen.dart';

class Game2ReadyScreen extends StatefulWidget {
  const Game2ReadyScreen({super.key});

  @override
  State<Game2ReadyScreen> createState() => _ReadyDialogState();
}

class _ReadyDialogState extends State<Game2ReadyScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5430), () {
      Get.to(() => const Game2Screen());
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
    );
  }
}
