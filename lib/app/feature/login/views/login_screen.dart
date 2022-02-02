
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global/global.dart';
import '../../constant.dart';

import '../../main.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(height: 15,);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Login',
          style: defaultTitle,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        decoration: defaultBackground,
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
                  style: defaultInputText,
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
                  style: defaultInputText,
                ),
              ),
              _spacer,
              TextButton(
                style: defaultButtonStyle,
                onPressed: () {
                  global = true;
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage()
                    ),
                    (Route<dynamic> route) => false
                  );
                },
                child: Text(
                  'Login',
                  style: defaultText,
                ),
              ),
              _spacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account',
                    style: defaultText,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen()
                        )
                      );
                    },
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
        )
      ),
    );
  }
}
