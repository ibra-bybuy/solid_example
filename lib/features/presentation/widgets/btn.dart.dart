import 'package:flutter/material.dart';

class AuthBtn extends StatelessWidget {
  final void Function()? onPressed;
  const AuthBtn({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text("Войти"),
    );
  }
}
