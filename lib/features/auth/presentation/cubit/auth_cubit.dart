import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/auth_entities.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUsecase;
  AuthCubit(this.authUsecase) : super(AuthInitial());

  Future<void> auth(AuthEntities entities) async {
    emit(AuthLoading()); // Меняет состояние на: загрузка
    final response =
        await authUsecase.signIn(entities); // Отправляет запрос на авторизацию
    emit(AuthLoaded(response)); // Меняет состояние на ответ запроса
  }
}
