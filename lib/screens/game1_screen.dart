import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/controllers/game1_controller.dart';

import 'components/body.dart';

class Game1Screen extends StatelessWidget {
  const Game1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Image.asset(
            'assets/go-back.png',
            scale: 2.5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: _controller.nextQuestion,
              child: const Text(
                "Bỏ qua",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 58, 65, 127),
              Color.fromARGB(255, 21, 23, 81),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Body(),
      ),
    );
  }
}
