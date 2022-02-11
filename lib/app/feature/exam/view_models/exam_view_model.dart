
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/base_view_model.dart';
import '../../../data/list_card.dart';
import '../../../../data/tests/service/test_service.dart';
import '../../../../data/cards/models/card_model.dart';
import '../../../../data/topics/models/topic_model.dart';
import '../../../../global/global.dart';

class ExamViewModel extends BaseViewModel {
  static final TopicModel _topicModel = Get.arguments;
  final String title = _topicModel.name;
  final RxList base = RxList(_topicModel.listCard);

  final RxList card = RxList([]);
  final RxList clone = RxList([]);
  final RxList leftRight = RxList([]);
  final RxList choose = RxList([]);
  final RxList<int> answer = RxList([]);
  final RxList<String> question = RxList([]);

  final int limitTest = 7;

  void makeTest() {
    base.value = [];
    for (int i = 0; i < _topicModel.listCard.length; i++) {
      for (CardModel c in listCard) {
        if (c.id == _topicModel.listCard[i]) base.add(c);
      }
    }

    List<int> checker = [];
    card.value = [];
    clone.value = [];
    leftRight.value = [];

    for (int i = 0; i < base.length; i++) {
      checker.add(i);
    }

    for (int i = 0; i < limitTest; i++) {
      int x, y;
      x = Random().nextInt(checker.length);
      card.add(base[checker[x]]);

      do {
        y = Random().nextInt(base.length);
      } while (y == checker[x]);
      clone.add(base[y]);
      leftRight.add(Random().nextBool());

      checker.removeAt(x);
    }

    choose.value = [];
    answer.value = [];
    question.value = [];
    for (int i = 0; i < limitTest; i++) {
      choose.add(0);
      answer.add(0);
      question.add('');
    }
  }

  void submit() {
    List<bool> checkAnswer = [];
    int score = 0;
    for (int i = 0; i < limitTest; i++) {
      if (choose[i] == answer[i]) score++;
      checkAnswer.add(choose[i] == answer[i]);
    }

    TestService().submitTest(
      user,
      title,
      question,
      checkAnswer,
      '$score/$limitTest',
      DateTime.now(),
    );

    Get.defaultDialog(
      title: 'Kết quả làm bài',
      titleStyle: ThemeData().textTheme.headline2,
      middleText: 'Số câu đúng $score/$limitTest',
      middleTextStyle: ThemeData().textTheme.headline3,
      confirm: TextButton(
        onPressed: Get.back,
        child: const Text('OK'),
      ),
    );
  }
}
