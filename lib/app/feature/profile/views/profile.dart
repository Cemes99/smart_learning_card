
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/default_app_bar.dart';
import '../view_models/profile_view_model.dart';

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
