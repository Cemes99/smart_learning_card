
import 'package:flutter/material.dart';
import 'package:smart_learning_card/app/base/constant.dart';

import '../feature/login/views/login_screen.dart';

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
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              textStyle: Theme.of(context).textTheme.bodyText1
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen())
            );
          },
          child: Text(
            'Login',
            style: Theme.of(context).textTheme.headline1
          ),
        ),
      ),
    );
  }
}
