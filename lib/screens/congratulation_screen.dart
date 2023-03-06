import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:lottie/lottie.dart';
import 'package:math_quiz/screens/game1_screen.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _ReadyDialogState();
}

class _ReadyDialogState extends State<CongratulationScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 5430), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const Game1Screen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
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
    );
  }
}
