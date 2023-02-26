import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/game1_data.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;

  // to animate progress bar
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = Question.data
      .map(
        (question) => Question(question['id'], question['level'],
            question['point'], question['options'], question['answer_index']),
      )
      .toList();
  List<Question> get questions => _questions;

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

  void checkAns(Question question, int selectedInx) {
    _isAnswered = true;
    _correctAns = question.answerIndex;
    _selectedAns = selectedInx;

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
    if (_questionNumber.value != _questions.length) {
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
