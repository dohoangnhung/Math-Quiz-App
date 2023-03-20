import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/game2_screens/g2_globals.dart';
import 'package:math_quiz/game2_screens/game2_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigator.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Get.offAll(() => const NavigatorPage());
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
                onPressed: () async {
                  setLevel(1);
                  glbLevel.value = (await getLevel())!;
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
                style: (glbUnblock == true && glbLevel.value == 1) ||
                        glbLevel >= 2
                    ? ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 46, 46, 46)),
                        elevation: MaterialStateProperty.all(1),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 25)),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 174, 174, 174)),
                        elevation: MaterialStateProperty.all(1),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 25)),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                onPressed: () async {
                  (glbUnblock == true && glbLevel.value == 1) || glbLevel >= 2
                      ? {
                          setLevel(2),
                          glbLevel.value = (await getLevel())!,
                          glbUnblock = false,
                          Get.to(() => const Game2Screen()),
                        }
                      : null;
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
                style: (glbUnblock == true && glbLevel.value == 2) ||
                        glbLevel >= 3
                    ? ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 46, 46, 46)),
                        elevation: MaterialStateProperty.all(1),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 25)),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                    : ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 174, 174, 174)),
                        elevation: MaterialStateProperty.all(1),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 25)),
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                          (_) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                onPressed: () async {
                  (glbUnblock == true && glbLevel.value == 2) || glbLevel >= 3
                      ? {
                          setLevel(3),
                          glbLevel.value = (await getLevel())!,
                          glbUnblock = false,
                          Get.to(() => const Game2Screen()),
                        }
                      : null;
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

// set level
Future<bool> setLevel(value) async {
  final pref = await SharedPreferences.getInstance();
  print(value);
  return await pref.setInt('prefLevel', value);
}

// get level
Future<int?> getLevel() async {
  final pref = await SharedPreferences.getInstance();
  return pref.getInt('prefLevel');
}
