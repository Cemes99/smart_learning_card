
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/base/constant.dart';
import 'package:smart_learning_card/app/route/app_routes.dart';

import '../feature/login/views/login_screen.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Center(
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: Theme.of(context).textTheme.bodyText1
            ),
            onPressed: () => Get.toNamed(Routes.login),
            child: Text(
                'Login',
                style: Theme.of(context).textTheme.headline1
            ),
          ),
        ),
      ),
    );
  }
}
