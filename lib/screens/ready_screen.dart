import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:lottie/lottie.dart';
import 'package:math_quiz/screens/game1_screen.dart';

class ReadyDialog extends StatefulWidget {
  const ReadyDialog({super.key});

  @override
  State<ReadyDialog> createState() => _ReadyDialogState();
}

class _ReadyDialogState extends State<ReadyDialog> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5430), () {
      Get.to(() => const Game1Screen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
