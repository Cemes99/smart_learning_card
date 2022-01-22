
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/card_screen.dart';
import '../data/list_card.dart';
import '../models/card_model.dart';
import '../models/topic_model.dart';

class ListCardScreen extends StatelessWidget {
  const ListCardScreen({Key? key, required this.topicModel}) : super(key: key);

  final TopicModel topicModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<CardModel> list = [];
    String x = '';

    for(int i = 0; i < topicModel.listCard.length; i++) {
      if(topicModel.listCard[i] == ',') {
        for(CardModel c in listCard) {
          if(c.id == x) {
            list.add(c);
            break;
          }
        }

        x = '';
        continue;
      }
      x += topicModel.listCard[i];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2b2b2b),
        title: Text(
          topicModel.name,
          style: GoogleFonts.nunito(
              fontWeight: FontWeight.w600,
              fontSize: 25
          ),
        ),
        centerTitle: true,
        shape: const Border(bottom: BorderSide(color: Colors.grey, width: 2)),
      ),
      body: Container(
        width: width,
        decoration: const BoxDecoration(
            color: Color(0xff2b2b2b)
        ),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 30),
          scrollDirection: Axis.vertical,
          itemCount: list.length,
            itemBuilder: (context, index) {
              return CardScreen(card: list[index]);
            },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10,);
          },
        )
      ),
    );
  }
}

