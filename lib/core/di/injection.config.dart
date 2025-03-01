// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tapinvest/core/di/app_module.dart' as _i149;
import 'package:tapinvest/features/home/data/repositories/home_repository_impl.dart'
    as _i153;
import 'package:tapinvest/features/home/domain/repositories/home_repository.dart'
    as _i468;
import 'package:tapinvest/features/home/presentation/bloc/home_bloc.dart'
    as _i789;
import 'package:tapinvest/services/api_client.dart' as _i525;
import 'package:tapinvest/services/dio_client.dart' as _i1006;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioClient = _$DioClient();
    final appModule = _$AppModule();
    gh.lazySingleton<_i361.Dio>(() => dioClient.dio);
    gh.factory<String>(() => appModule.baseUrl, instanceName: 'baseUrl');
    gh.factory<_i525.ApiClient>(
      () => _i525.ApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.factory<_i468.HomeRepository>(
      () => _i153.HomeRepositoryImpl(apiClient: gh<_i525.ApiClient>()),
    );
    gh.factory<_i789.HomeBloc>(
      () => _i789.HomeBloc(homeRepository: gh<_i468.HomeRepository>()),
    );
    return this;
  }
}

class _$DioClient extends _i1006.DioClient {}

class _$AppModule extends _i149.AppModule {}
