import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  const LoginTextField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Логин"),
      onChanged: onChanged,
    );
  }
}
