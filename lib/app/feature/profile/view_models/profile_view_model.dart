
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/components/body_profile.dart';
import '../../../base/base_view_model.dart';
import '../../../components/pre_login_screen.dart';
import '../../../route/app_routes.dart';
import '../../../../global/global.dart';

class ProfileViewModel extends BaseViewModel {
  final String title = 'Thông tin cá nhân';
  final String titleDetails = 'Thông tin chi tiết';
  final String profileDetailsButton = 'Xem thông tin chi tiết';
  final String logoutButton = 'Đăng xuất';

  void listenButton(String name) {
    if(name == profileDetailsButton) {
      toProfileDetails();
      return ;
    }

    if(name == logoutButton) {
      logout();
      return ;
    }
  }

  void toProfileDetails() {
    Get.toNamed(Routes.profileDetails);
  }

  void logout() {
    global = false;
    Get.offAllNamed(Routes.home);
  }

  Widget display() {
    if(global) {
      return const BodyProfile();
    }

    return const PreLoginScreen();
  }
}