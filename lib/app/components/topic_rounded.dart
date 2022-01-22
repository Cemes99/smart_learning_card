
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../models/topic_model.dart';
import '../screens/list_card.dart';

class TopicRounded extends StatelessWidget {
  const TopicRounded({Key? key, required this.topic}) : super(key: key);

  final TopicModel topic;

  @override
  Widget build(BuildContext context) {
    double width = 100;
    double height = 150;
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCardScreen(topicModel: topic)
                ));
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      painter: ProcessPaint(),
                    ),
                    const Icon(
                      Icons.title,
                      color: Colors.yellow,
                      size: 50,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              topic.name,
              style: defaultText
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
        ..strokeWidth = 7
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}