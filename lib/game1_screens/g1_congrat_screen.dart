import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../controllers/game1_controller.dart';
import '../navigator.dart';

class CongratScreen extends StatefulWidget {
  const CongratScreen({super.key});

  @override
  State<CongratScreen> createState() => _CongratState();
}

class _CongratState extends State<CongratScreen> {
  @override
  Widget build(BuildContext context) {
    Game1Controller _questionController = Get.put(Game1Controller());
    double scrHeight = MediaQuery.of(context).size.height;

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
              const Text(
                'Chúc mừng!',
                style: TextStyle(
                  color: Color.fromARGB(255, 228, 45, 32),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3,
                ),
              ),
              SizedBox(height: scrHeight / 60),
              const Text(
                'Bạn đã hoàn thành tất cả các lượt chơi',
                style: TextStyle(
                  color: Color.fromARGB(255, 83, 74, 73),
                  fontSize: 19,
                ),
              ),
              SizedBox(height: scrHeight / 30),
              Lottie.asset(
                'assets/congratulation.json',
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: scrHeight / 30),
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
                          fontFamily: 'RobotoSlab',
                          wordSpacing: 1.2,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ),
              ),
              SizedBox(height: scrHeight / 15),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 53, 28, 92)),
                  elevation: MaterialStateProperty.all(1),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 25)),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (_) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
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
