import 'package:auth_clean/features/domain/entities/auth_entities.dart';
import 'package:auth_clean/features/presentation/widgets/login_fiel.dart';
import 'package:auth_clean/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../widgets/btn.dart.dart';
import '../widgets/password_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final authEntities = AuthEntities();
  final authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listener: (context, state) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (state is AuthLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.isSuccess
                ? "Успешная авторизация"
                : "Неправильный логин или пароль"),
          ));
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Авторизация"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginTextField(
                onChanged: (str) => authEntities.login = str,
              ),
              PasswordTextField(
                onChanged: (str) => authEntities.password = str,
              ),
              AuthBtn(
                onPressed: () => authCubit.auth(authEntities),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
