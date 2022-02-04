
import 'package:flutter/material.dart';
import '../base/constant.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      centerTitle: true,
      shape: const Border(bottom: defaultAppBarLine),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(appBarHeight);

}