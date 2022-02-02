
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_learning_card/app/feature/home/views/home_screen.dart';
import 'package:smart_learning_card/app/feature/login/view_models/login_view_model.dart';
import '../../../../global/global.dart';
import '../../../base/constant.dart';

import '../../register/view/register_screen.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(height: 15,);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                decoration: borderInput,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              _spacer,
              Container(
                decoration: borderInput,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                      hintText: 'Password',
                  ),
                  obscureText: true,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              _spacer,
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: Theme.of(context).textTheme.bodyText1
                ),
                onPressed: controller.toHome,
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              _spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  TextButton(
                    onPressed: controller.toRegister,
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.nunito(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
