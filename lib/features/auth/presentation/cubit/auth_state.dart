part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final bool isSuccess;

  const AuthLoaded(this.isSuccess);

  @override
  List<Object> get props => [isSuccess];
}
