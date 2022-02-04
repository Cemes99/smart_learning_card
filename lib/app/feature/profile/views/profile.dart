
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_learning_card/app/components/default_app_bar.dart';
import 'package:smart_learning_card/app/feature/profile/view_models/profile_view_model.dart';
import 'components/button_profile.dart';

import '../../../base/constant.dart';

class ProfileScreen extends GetView<ProfileViewModel> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: controller.title,),
      body: controller.display(),
    );
  }
}
