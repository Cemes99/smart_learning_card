
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const BoxDecoration borderInput = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(8))
);

const Color backgroundColor = Color(0xff2b2b2b);

const BoxDecoration defaultBackground = BoxDecoration(
    color: backgroundColor,
);

const BorderSide defaultAppBarLine = BorderSide(color: Colors.grey, width: 2);

final TextStyle defaultTitle = GoogleFonts.nunito(
  color: Colors.white,
  fontSize: 30,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.w600
);

final TextStyle defaultText = GoogleFonts.nunito(
  color: Colors.white,
  fontSize: 15,
  decoration: TextDecoration.none
);

final TextStyle defaultInputText = GoogleFonts.nunito(
  color: Colors.black,
  fontSize: 15,
  decoration: TextDecoration.none
);

final ButtonStyle defaultButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.blue,
  textStyle: defaultText
);
