
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_learning_card/app/route/app_pages.dart';
import 'app/base/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {

        if(!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // print('data');
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
      },
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
      button: GoogleFonts.nunito(
        color: Colors.blue,
        fontSize: 15,
        decoration: TextDecoration.none,
      )
    );
  }
}
