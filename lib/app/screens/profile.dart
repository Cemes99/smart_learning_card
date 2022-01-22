
import 'package:flutter/material.dart';
import '../components/button_profile.dart';

import '../../constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final String title = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          title,
          style: defaultTitle,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xff2b2b2b)
        ),
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
