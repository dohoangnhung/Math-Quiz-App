import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:math_quiz/controllers/game1_controller.dart";

import '../../models/game1_data_generator.dart';
import 'g1_option.dart';

class QuestionCard extends StatelessWidget {
  final List<Pair> question;

  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Game1Controller _controller = Get.put(Game1Controller());
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            'Biểu thức nào có giá trị bé hơn?',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: const Color.fromRGBO(16, 16, 16, 1)),
          ),
          const SizedBox(height: 10),
          ...List.generate(
            question.length,
            (index) => Option(
              index: index,
              text: question[index].exp,
              press: () => {
                // only choose one option at a time
                _controller.isAnswered == false
                    ? _controller.checkAns(question, index)
                    : null,
              },
            ),
          ),
        ],
      ),
    );
  }
}
