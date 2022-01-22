
import 'package:flutter/material.dart';
import 'package:smart_learning_card/constant.dart';

import 'login_screen.dart';

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PreLoginScreen> createState() => _PreLoginScreenState();
}

class _PreLoginScreenState extends State<PreLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          widget.title,
          style: defaultTitle,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        decoration: defaultBackground,
        child: Center(
          child: TextButton(
            style: defaultButtonStyle,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen())
              );
            },
            child: Text(
              'Login',
              style: defaultTitle
            ),
          ),
        ),
      ),
    );
  }
}
