import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../view_models/login_view_model.dart';
import '../../../base/constant.dart';
import '../../../components/input_field.dart';
import '../../../components/default_app_bar.dart';

class LoginScreen extends GetView<LoginViewModel> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(
      height: 15,
    );

    return Scaffold(
      appBar: DefaultAppBar(title: controller.title),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              InputField(
                onChanged: (text) => controller.onUsernameChange(text),
                hint: controller.hintTextUsername,
                obscure: false,
              ),
              _spacer,
              InputField(
                onChanged: (text) => controller.onPasswordChange(text),
                hint: controller.hintTextPassword,
                obscure: true,
              ),
              _spacer,
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: Theme.of(context).textTheme.bodyText1,
                ),
                onPressed: () async {
                  await controller.submit();
                  Get.defaultDialog(
                    title: controller.result == LoginState.succeed
                        ? 'Đăng nhập thành công'
                        : 'Đăng nhập thất bại',
                    titleStyle: ThemeData().textTheme.headline2,
                    middleText: controller.submitResult(),
                    middleTextStyle: ThemeData().textTheme.headline3,
                    confirm: TextButton(
                      onPressed: controller.result == LoginState.succeed
                          ? controller.toHome
                          : Get.back,
                      child: const Text('OK'),
                    ),
                  );
                },
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
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
