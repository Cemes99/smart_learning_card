
import 'package:flutter/material.dart';
import '../../view_models/profile_view_model.dart';
import 'button_profile.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileViewModel vm = ProfileViewModel();
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          ButtonProfile(name: vm.profileDetailsButton),
          ButtonProfile(name: vm.logoutButton),
          // Icon(Icons.menu_book)
        ],
      ),
    );
  }
}
