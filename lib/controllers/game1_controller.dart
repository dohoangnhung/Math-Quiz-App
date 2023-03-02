import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/game1_data_generator.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // to animate progress bar
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  Game1DataGenerator dataGenerator = Get.put(Game1DataGenerator());

  @override
  void onInit() {
    // fill the progress bar within 60s
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    // when 60s ends, go to the next question
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  // generate question set to display in the game
  List<List<Pair>> getQuestions() {
    List<List<Pair>> playQuestions = [];

    for (int i = 0; i < 5; i++) {
      playQuestions.add(dataGenerator.genQuestionLv1);
    }
    for (int i = 0; i < 9; i++) {
      playQuestions.add(dataGenerator.genQuestionLv2);
    }
    for (int i = 0; i < 10; i++) {
      playQuestions.add(dataGenerator.genQuestionLv3);
    }
    for (int i = 0; i < 24; i++) {
      playQuestions.add(dataGenerator.genQuestionLv4);
    }
    for (int i = 0; i < 24; i++) {
      playQuestions.add(dataGenerator.genQuestionLv5);
    }
    return playQuestions;
  }

  void checkAns(List<Pair> options, int selectedInx) {
    _isAnswered = true;
    _selectedAns = selectedInx;

    // check which option is correct
    int opt1 = options[0].value;
    int opt2 = options[1].value;
    if (opt1 < opt2) {
      _correctAns = 0;
    }
    if (opt1 > opt2) {
      _correctAns = 1;
    }

    if (_selectedAns == _correctAns) {
      _numOfCorrectAns++;
    }

    // stop the progress bar
    _animationController.stop();
    update();

    // wait 1500 milliseconds before go to the next question
    Future.delayed(const Duration(milliseconds: 1500), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != getQuestions().length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      // reset progress bar
      _animationController.reset();

      // then start it agian
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get.to(ScoreScreen());
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
