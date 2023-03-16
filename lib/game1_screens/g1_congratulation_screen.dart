import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../controllers/game1_controller.dart';
import '../navigator.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _ReadyDialogState();
}

class _ReadyDialogState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    Game1Controller _questionController = Get.put(Game1Controller());

    const colorizeColors = [
      Color.fromARGB(255, 201, 51, 51),
      Color.fromARGB(255, 240, 172, 71),
      Color.fromARGB(255, 207, 249, 83),
      Colors.green,
    ];

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const NavigatorPage());
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Chúc Mừng Bạn Đã Hoàn Thành \n Tất Cả Vòng Chơi!',
                        colors: colorizeColors,
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Lottie.asset(
                'assets/congratulation.json',
                height: 300,
                fit: BoxFit.contain,
                repeat: false,
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Điểm: ${_questionController.getPoint}\nSố câu đúng: ${_questionController.numOfCorrectAns}/100\nThời gian chơi: ${_questionController.totalResponseTime} giây',
                        textStyle: const TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.3,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 113, 91, 226)),
                  elevation: MaterialStateProperty.all(1),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (_) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.offAll(() => const NavigatorPage());
                },
                child: const Text(
                  'Quay lại màn hình chính',
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
