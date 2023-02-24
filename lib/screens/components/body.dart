import 'package:flutter/material.dart';
import 'package:math_quiz/screens/components/progress_bar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProgressBar(),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: "Question 1",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: const Color.fromRGBO(139, 148, 188, 1)),
                    children: [
                      TextSpan(
                        text: "/10",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: const Color.fromRGBO(139, 148, 188, 1)),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1.5),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ],
    );
  }
}
