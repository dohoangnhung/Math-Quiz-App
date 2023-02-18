import 'dart:async';

import 'package:flutter/material.dart';
import 'package:math_quiz/const/colors.dart';

import 'api_services.dart';
import 'const/images.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
      title: 'Math Quiz',
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  void initState() {
    super.initState();
    quiz = getQuiz();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  int playTime = 60;
  Timer? timer;
  var currentQuestionIndex = 0;
  late Future quiz;

  var isLoaded = false;
  var optionList = [];
  var optionColor = [Colors.white, Colors.white, Colors.white, Colors.white];

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (playTime > 0) {
          playTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  resetColors() {
    optionColor = [Colors.white, Colors.white, Colors.white, Colors.white];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [oceanblue, darkblue],
              ),
            ),
            child: FutureBuilder(
              future: quiz,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data['results'];
                  if (isLoaded == false) {
                    optionList =
                        data[currentQuestionIndex]['incorrect_answers'];
                    optionList
                        .add(data[currentQuestionIndex]['correct_answer']);
                    optionList.shuffle();
                    isLoaded = true;
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              '$playTime',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                value: playTime / 60,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          question,
                          width: 200,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Question ${currentQuestionIndex + 1} of ${data.length}:',
                            style: const TextStyle(
                              color: lightgrey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data[currentQuestionIndex]['question'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: optionList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var answer =
                                data[currentQuestionIndex]['correct_answer'];

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (answer.toString() ==
                                      optionList[index].toString()) {
                                    optionColor[index] = Colors.green;
                                  } else {
                                    optionColor[index] = Colors.red;
                                  }
                                  if (currentQuestionIndex < data.length - 1) {
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      isLoaded = false;
                                      currentQuestionIndex++;
                                      resetColors();
                                      timer!.cancel();
                                      playTime = 60;
                                      startTimer();
                                    });
                                  } else {
                                    timer!.cancel();
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.center,
                                width: size.width - 100,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: optionColor[index],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  optionList[index].toString(),
                                  style: const TextStyle(
                                    color: darkblue,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                }
              },
            )),
      ),
    );
  }
}
