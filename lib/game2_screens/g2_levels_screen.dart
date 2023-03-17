import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/controllers/game2_controller.dart';
import 'package:math_quiz/game2_screens/game2_screen.dart';

import '../navigator.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Game2Controller _controller = Get.put(Game2Controller());
    double scrHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const NavigatorPage());
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Image.asset(
              'assets/go-back.png',
              scale: 2.5,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/level.png',
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: scrHeight / 30),
              const Text(
                'Cấp độ',
                style: TextStyle(
                  fontSize: 34,
                  fontFamily: 'RobotoSlab',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: scrHeight / 60),
              const Text(
                'Hãy chọn cấp độ bạn muốn chơi:',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoSlab',
                ),
              ),
              SizedBox(height: scrHeight / 20),

              //! level 1
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 46, 46, 46)),
                  elevation: MaterialStateProperty.all(1),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 25)),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (_) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  _controller.setLevel = 1.obs;
                  Get.to(() => const Game2Screen());
                },
                child: const Text(
                  'Độ khó 1',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: scrHeight / 60),

              //! level 2
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 46, 46, 46)),
                  elevation: MaterialStateProperty.all(1),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 25)),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (_) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  _controller.setLevel = 2.obs;
                  Get.to(() => const Game2Screen());
                },
                child: const Text(
                  'Độ khó 2',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: scrHeight / 60),

              //! level 3
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 46, 46, 46)),
                  elevation: MaterialStateProperty.all(1),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 25)),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (_) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  _controller.setLevel = 3.obs;
                  Get.to(() => const Game2Screen());
                },
                child: const Text(
                  'Độ khó 3',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
