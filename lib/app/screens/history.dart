
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../base/constant.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  final String title = 'History';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor
        ),
        child: Center(
          child: Text(
            'History Screen',
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 30
            ),
          ),
        ),
      ),
    );
  }
}
