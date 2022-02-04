
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_learning_card/app/base/constant.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: PageView(
          controller: PageController(
              initialPage: 0
          ),
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                },
                child: Text(
                  'Click',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
