import 'package:auth_clean/features/domain/entities/auth_entities.dart';
import 'package:auth_clean/features/domain/usecases/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUsecase;
  AuthCubit(this.authUsecase) : super(AuthInitial());

  Future<void> auth(AuthEntities entities) async {
    emit(AuthLoading());
    final response = await authUsecase.signIn(entities);
    emit(AuthLoaded(response));
  }
}
