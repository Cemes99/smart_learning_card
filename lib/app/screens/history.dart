
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  final String title = 'History';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          title,
          style: defaultTitle,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xff2b2b2b)
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
