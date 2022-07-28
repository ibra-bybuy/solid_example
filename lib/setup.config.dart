// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/data/repository/auth_impl.dart' as _i5;
import 'features/data/sources/auth_source.dart' as _i3;
import 'features/domain/repository/auth_repository.dart' as _i4;
import 'features/domain/usecases/auth_usecase.dart' as _i6;
import 'features/presentation/cubit/auth_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthSource>(() => _i3.AuthSourceImpl());
  gh.lazySingleton<_i4.AuthRepository>(
      () => _i5.AuthImpl(get<_i3.AuthSource>()));
  gh.lazySingleton<_i6.AuthUsecase>(
      () => _i6.AuthUsecase(get<_i4.AuthRepository>()));
  gh.factory<_i7.AuthCubit>(() => _i7.AuthCubit(get<_i6.AuthUsecase>()));
  return get;
}
