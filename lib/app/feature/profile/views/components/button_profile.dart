
import 'package:flutter/material.dart';
import '../../view_models/profile_view_model.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final ProfileViewModel vm = ProfileViewModel();

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        height: 50,
        width: width,
        child: TextButton(
          onPressed: () => vm.listenButton(name),
          child: Text(
            name,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
