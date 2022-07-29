import 'package:auth_clean/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/auth_entities.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/btn.dart.dart';
import '../widgets/login_field.dart';
import '../widgets/password_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Собирает данные после ввода пользователем их на UI
  final authEntities = AuthEntities();
  // Управление состоянием экрана
  final authCubit = getIt<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      // Будет слушать на предмет авторизации
      listener: (context, state) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (state is AuthLoaded) {
          // Выводим сообщение об итоговом статусе
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.isSuccess
                ? "Успешная авторизация"
                : "Неправильный логин или пароль"),
          ));
          // Удаляем фокус с полей
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
              // Ввод логина
              LoginTextField(onChanged: (str) => authEntities.login = str),
              // Ввод пароля
              PasswordTextField(
                  onChanged: (str) => authEntities.password = str),
              // Кнопка авторизации
              AuthBtn(onPressed: () => authCubit.auth(authEntities)),
            ],
          ),
        ),
      ),
    );
  }
}
