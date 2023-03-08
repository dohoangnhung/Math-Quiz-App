import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/screens/ready_screen.dart';
import 'package:math_quiz/screens/game1_screen.dart';

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
                Get.to(() => const ReadyDialog());
              },
              child: const Text('Game 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Game1Screen(),
                  ),
                );
              },
              child: const Text('Game 2'),
            ),
          ],
        ),
      ),
    );
  }
}
