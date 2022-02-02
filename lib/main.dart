
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_learning_card/app/feature/home/views/home_screen.dart';
import 'package:smart_learning_card/app/route/app_pages.dart';
import 'package:smart_learning_card/app/route/app_routes.dart';
import 'app/base/constant.dart';
import 'global/global.dart';

import 'app/screens/history.dart';
import 'app/feature/list_topic/views/list_topic.dart';
import 'app/components/pre_login_screen.dart';
import 'app/screens/profile.dart';
import 'app/screens/statistics.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _app = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Learning For Kid',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: backgroundColor,
        textTheme: _textTheme(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      headline1: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 30,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.w600,
      ),
      bodyText1: GoogleFonts.nunito(
          color: Colors.white,
          fontSize: 15,
          decoration: TextDecoration.none,
      ),
      bodyText2: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 15,
          decoration: TextDecoration.none,
      ),
    );
  }
}
