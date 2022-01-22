
import 'package:flutter/material.dart';

import '../../constant.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(height: 15, width: 30,);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Thông tin chi tiết',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration: borderInput,
                      child: Text(
                        'Tên người dùng',
                        style: defaultInputText,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 220,
                      decoration: borderInput,
                      child: Text(
                        'Bé Bi',
                        style: defaultText.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                _spacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration: borderInput,
                      child: Text(
                        'Tên tài khoản',
                        style: defaultInputText,
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 220,
                      decoration: borderInput,
                      child: Text(
                        'username',
                        style: defaultText.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
