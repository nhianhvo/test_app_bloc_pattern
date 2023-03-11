// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_source/remote/api_client.dart' as _i4;
import '../data_source/repository/home_repository.dart' as _i5;
import 'injectable_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Dio>(() => injectableModule.dio);
  gh.singleton<_i4.ApiClient>(_i4.ApiClient(get<_i3.Dio>()));
  gh.factory<_i5.HomeRepository>(
      () => _i5.HomeRepository(get<_i4.ApiClient>()));
  return get;
}

class _$InjectableModule extends _i6.InjectableModule {}
