
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(height: 15,);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Register',
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
                Container(
                  decoration: borderInput,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Re-Password',
                    ),
                    obscureText: true,
                    style: defaultInputText,
                  ),
                ),
                _spacer,
                TextButton(
                  style: defaultButtonStyle,
                  onPressed: () {

                  },
                  child: Text(
                    'Register',
                    style: defaultText,
                  ),
                ),
                _spacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account',
                      style: defaultText,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
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
