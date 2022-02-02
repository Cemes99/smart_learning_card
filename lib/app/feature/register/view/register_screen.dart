
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../base/constant.dart';

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
              Container(
                decoration: borderInput,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Re-Password',
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
                onPressed: () {

                },
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
