
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/profile_view_model.dart';
import '../../../components/default_app_bar.dart';
import '../../../base/constant.dart';

class ProfileDetails extends GetView<ProfileViewModel> {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget _spacer = SizedBox(height: 15, width: 30,);

    return Scaffold(
      appBar: DefaultAppBar(title: controller.titleDetails),
      body: Container(
        color: backgroundColor,
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
      ),
    );
  }
}
