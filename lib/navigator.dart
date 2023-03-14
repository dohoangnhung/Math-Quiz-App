import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/game1_screens/g1_ready_screen.dart';
import 'package:math_quiz/game2_screens/g2_ready_screen.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Game1ReadyScreen());
              },
              child: const Text('Game 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Game2ReadyScreen());
              },
              child: const Text('Game 2'),
            ),
          ],
        ),
      ),
    );
  }
}
