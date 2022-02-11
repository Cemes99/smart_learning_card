
import 'package:flutter/material.dart';

import '../../../../../data/topics/models/topic_model.dart';
import '../../view_models/list_topic_view_model.dart';

class TopicRounded extends StatelessWidget {
  const TopicRounded({Key? key, required this.topic}) : super(key: key);

  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    final ListTopicViewModel vm = ListTopicViewModel();

    double width = 100;
    double height = 150;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () => vm.toListCard(topic),
            child: SizedBox(
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(topic.img),
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () => vm.toListCard(topic),
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: Colors.blueAccent
          //     ),
          //     child: const Padding(
          //       padding: EdgeInsets.all(10),
          //       child: Icon(
          //         Icons.title,
          //         color: Colors.yellow,
          //         size: 50,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              topic.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}

class ProcessPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset.zero,
      45,
      Paint()
        ..color = Colors.white12
        ..style = PaintingStyle.stroke
        ..strokeWidth = 7,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}