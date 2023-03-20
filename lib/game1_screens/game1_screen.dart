import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_quiz/controllers/game1_controller.dart';
import 'package:quickalert/quickalert.dart';

import '../navigator.dart';
import 'components/g1_body.dart';

class Game1Screen extends StatelessWidget {
  const Game1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Game1Controller _controller = Get.put(Game1Controller());
    return WillPopScope(
      onWillPop: () async {
        showExitDialog(context);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: TextButton(
            onPressed: () {
              showExitDialog(context);
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
            image: DecorationImage(
              image: AssetImage('assets/universe.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Body(),
        ),
      ),
    );
  }
}

void showExitDialog(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.warning,
    title: 'Cảnh báo',
    text: 'Bạn có muốn thoát khỏi trò chơi?',
    textColor: const Color.fromARGB(255, 60, 60, 60),
    confirmBtnText: 'Có',
    confirmBtnColor: const Color.fromARGB(255, 4, 114, 117),
    onConfirmBtnTap: () {
      Get.offAll(() => const NavigatorPage());
    },
    confirmBtnTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    showCancelBtn: true,
    cancelBtnText: 'Không',
    onCancelBtnTap: () {
      Get.back();
    },
    cancelBtnTextStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
  );
}
