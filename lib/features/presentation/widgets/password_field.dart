import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  const PasswordTextField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Пароль",
      ),
      obscureText: true,
      onChanged: onChanged,
    );
  }
}
