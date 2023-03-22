import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/game1_screens/game1_screen.dart';

import 'game1_screens/g1_ready_screen.dart';
import 'game2_screens/g2_levels_screen.dart';

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
                Get.to(() => const Game1Screen());
              },
              child: const Text('Game 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const LevelsScreen());
              },
              child: const Text('Game 2'),
            ),
          ],
        ),
      ),
    );
  }
}
