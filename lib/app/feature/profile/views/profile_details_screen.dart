
import 'package:flutter/material.dart';

import '../base/constant.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(height: 15, width: 30,);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Thông tin chi tiết',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        shape: const Border(bottom: defaultAppBarLine),
      ),
      body: Padding(
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
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Container(
                  height: 80,
                  width: 220,
                  decoration: borderInput,
                  child: Text(
                    'Bé Bi',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: borderInput,
                  child: Text(
                    'Tên tài khoản',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Container(
                  height: 80,
                  width: 220,
                  decoration: borderInput,
                  child: Text(
                    'username',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
