import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_learning_card/app/base/constant.dart';

import '../view_models/list_card_view_model.dart';
import '../../../components/card_screen.dart';
import '../../../data/list_card.dart';
import '../../../../data/cards/models/card_model.dart';
import '../../../../data/topics/models/topic_model.dart';

class ListCardScreen extends GetView<ListCardViewModel> {
  const ListCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TopicModel topicModel = Get.arguments;

    for (int i = 0; i < topicModel.listCard.length; i++) {
      for (CardModel c in listCard) {
        if (c.id == topicModel.listCard[i]) {
          controller.list.add(c);
          break;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2b2b2b),
        title: Text(
          topicModel.name,
          style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () async => controller.getCard(topicModel.name),
            icon: const Icon(Icons.rotate_left_rounded),
          ),
          IconButton(
            onPressed: () => controller.goToExam(),
            icon: const Icon(Icons.sticky_note_2_rounded),
          ),
        ],
        centerTitle: true,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 2)),
      ),
      body: Container(
        color: backgroundColor,
        child: Obx(
          () => ListView.separated(
            padding: const EdgeInsets.only(top: 30),
            scrollDirection: Axis.vertical,
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return CardScreen(card: controller.list[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        ),
      ),
    );
  }
}
