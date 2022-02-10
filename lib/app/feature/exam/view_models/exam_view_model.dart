
import 'dart:math';

import 'package:get/get.dart';
import 'package:smart_learning_card/data/tests/service/test_service.dart';
import 'package:smart_learning_card/global/global.dart';
import '../../../base/base_view_model.dart';
import '../../../data/list_card.dart';
import '../../../../data/topics/models/card_model.dart';
import '../../../../data/topics/models/topic_model.dart';

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
    for(int i = 0; i < _topicModel.listCard.length; i++) {
      for(CardModel c in listCard) {
        if(c.id == _topicModel.listCard[i]) base.add(c);
      }
    }

    List<int> checker = [];
    card.value = [];
    clone.value = [];
    leftRight.value = [];

    for(int i = 0; i < base.length; i++) {
      checker.add(i);
    }

    for(int i = 0; i < limitTest; i++) {
      int x, y;
      x = Random().nextInt(checker.length);
      card.add(base[checker[x]]);

      do {
        y = Random().nextInt(base.length);
      } while(y == checker[x]);
      clone.add(base[y]);
      leftRight.add(Random().nextBool());

      checker.removeAt(x);
    }

    choose.value = [];
    answer.value = [];
    question.value = [];
    for(int i = 0; i < limitTest; i++) {
      choose.add(0);
      answer.add(0);
      question.add('');
    }
  }

  void submit() {
    List<bool> checkAnswer = [];
    for(int i = 0; i < limitTest; i++) {
      checkAnswer.add(choose[i] == answer[i]);
    }

    TestService().submitTest(user, question, checkAnswer);
  }
}