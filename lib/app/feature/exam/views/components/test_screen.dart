import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_models/exam_view_model.dart';
import '../../../../base/constant.dart';
import '../../../../base/text_to_speech.dart';
import '../../../../../data/topics/models/card_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({
    Key? key,
    required this.card,
    required this.clone,
    required this.leftRight,
    required this.vm,
    required this.index,
  }) : super(key: key);

  final CardModel card;
  final CardModel clone;
  final bool leftRight;
  final ExamViewModel vm;
  final int index;

  @override
  Widget build(BuildContext context) {
    leftRight ? vm.answer[index] = 0 : vm.answer[index] = 1;
    vm.question[index] = card.content;

    return Container(
      padding: const EdgeInsets.all(paddingSide),
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Center(
              child: Image.asset(card.img),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Obx(() => GestureDetector(
                  onTap: () async {
                    TextToSpeech(
                      content: leftRight ? card.content : clone.content,
                    ).speak();
                    vm.choose[index] = 0;
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: vm.choose[index] == 0
                            ? Colors.green
                            : Colors.transparent,
                        width: 3,
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(child: Icon(Icons.volume_up_rounded)),
                  ),
                ),),
              ),
              const Spacer(
                flex: 1,
              ),
              Flexible(
                flex: 6,
                child: Obx(() => GestureDetector(
                  onTap: () async {
                    TextToSpeech(
                      content: !leftRight ? card.content : clone.content,
                    ).speak();
                    vm.choose[index] = 1;
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: vm.choose[index] == 1
                            ? Colors.green
                            : Colors.transparent,
                        width: 3,
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(child: Icon(Icons.volume_up_rounded)),
                  ),
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
