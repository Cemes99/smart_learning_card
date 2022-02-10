
import 'package:flutter/material.dart';

const BoxDecoration borderInput = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(8))
);

const Color backgroundColor = Color(0xff2b2b2b);

const BorderSide defaultAppBarLine = BorderSide(color: Colors.grey, width: 2);

const double appBarHeight = 56.0;

const double paddingSide = 15;

enum LoginState {
  succeed,
  invalidLengthUsername,
  invalidFormatUsername,
  invalidLengthPassword,
  invalidFormatPassword,
  noUser,
  wrongPassword,
  bug,
}

enum RegisterState {
  succeed,
  invalidLengthUsername,
  invalidFormatUsername,
  invalidLengthPassword,
  invalidFormatPassword,
  invalidLengthRepeatPassword,
  invalidFormatRepeatPassword,
  differPassword,
  existedUser,
  bug,
}