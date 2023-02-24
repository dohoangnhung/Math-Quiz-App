import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/controllers/game1_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border:
            Border.all(color: const Color.fromRGBO(63, 71, 104, 1), width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      child: GetBuilder<QuestionController>(
        builder: (controller) {
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraint) => Container(
                  // animate the running progress bar
                  width: constraint.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(70, 160, 174, 1),
                        Color.fromRGBO(0, 255, 203, 1)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      Image.asset("assets/clock.png", scale: 1.3),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
