import 'package:flutter/material.dart';
import '../base/constant.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.hint, required this.obscure, required this.onChanged})
      : super(key: key);

  final String hint;
  final bool obscure;
  final Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderInput,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
        obscureText: obscure,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
