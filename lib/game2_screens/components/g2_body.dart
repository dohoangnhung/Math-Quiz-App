import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/game2_controller.dart';
import 'g2_progress_bar.dart';
import 'g2_question_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Game2Controller _controller = Get.put(Game2Controller());
    final List<List<int>> questionSet = _controller.getQuestions();

    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/medal.png',
                            scale: 1.9,
                          ),
                          Obx(
                            () => Text.rich(
                              TextSpan(
                                text: ' ĐIỂM SỐ ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: const Color.fromRGBO(
                                            139, 148, 188, 1)),
                                children: [
                                  TextSpan(
                                    text: "${_controller.getPoint}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: const Color.fromRGBO(
                                                139, 148, 188, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/flag.png',
                            scale: 1.2,
                          ),
                          Obx(
                            () => Text.rich(
                              TextSpan(
                                text: 'CẤP ĐỘ ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: const Color.fromRGBO(
                                            139, 148, 188, 1)),
                                children: [
                                  TextSpan(
                                    text: "${_controller.getLevel}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: const Color.fromRGBO(
                                                139, 148, 188, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProgressBar(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Câu hỏi ${_controller.questionNumber}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: const Color.fromRGBO(139, 148, 188, 1)),
                      children: [
                        TextSpan(
                          text: "/${questionSet.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color:
                                      const Color.fromRGBO(139, 148, 188, 1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1.5,
                  color: Color.fromRGBO(63, 71, 104, 1),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  // block swipe to the next question
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller.pageController,
                  onPageChanged: _controller.updateQuestionNumber,
                  itemCount: questionSet.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: questionSet[index],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
