import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_learning_card/app/components/input_field.dart';
import 'package:smart_learning_card/app/feature/register/view_models/register_view_model.dart';

import '../../../base/constant.dart';

class RegisterScreen extends GetView<RegisterViewModel> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(
      height: 15,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Register',
          style: Theme.of(context).textTheme.headline1,
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
              InputField(
                onChanged: (text) => controller.onUsernameChange(text),
                hint: controller.hintUsername,
                obscure: false,
              ),
              _spacer,
              InputField(
                onChanged: (text) => controller.onPasswordChange(text),
                hint: controller.hintPassword,
                obscure: true,
              ),
              _spacer,
              InputField(
                onChanged: (text) => controller.onRepeatPasswordChange(text),
                hint: controller.hintRepeatPassword,
                obscure: true,
              ),
              _spacer,
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: Text(
                  'Register',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              _spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Already have account',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
