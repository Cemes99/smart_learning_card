
import 'package:flutter/material.dart';
import '../components/button_profile.dart';

import '../base/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final String title = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: const [
            ButtonProfile(name: 'Xem thông tin người dùng'),
            ButtonProfile(name: 'Đăng xuất')
          ],
        ),
      ),
    );
  }
}
