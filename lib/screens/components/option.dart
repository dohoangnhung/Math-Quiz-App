import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:math_quiz/controllers/game1_controller.dart';

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;

  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Colors.green;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red;
              }
            }
            return const Color.fromRGBO(193, 193, 193, 1);
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: getTheRightColor(),
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() ==
                              const Color.fromRGBO(193, 193, 193, 1)
                          ? Colors.transparent
                          : getTheRightColor(),
                      border: Border.all(
                        color: getTheRightColor(),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      getTheRightIcon(),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
