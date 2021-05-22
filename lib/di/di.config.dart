// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:objectbox/objectbox.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../data/repository/user_repository_impl.dart' as _i20;
import '../data/source/local/database/database_api.dart' as _i17;
import '../data/source/local/database/model/mapper/local_image_url_data_mapper.dart'
    as _i6;
import '../data/source/local/database/model/mapper/local_user_data_mapper.dart'
    as _i7;
import '../data/source/local/preference/app_preferences.dart' as _i16;
import '../data/source/local/preference/model/mapper/preference_user_data_mapper.dart'
    as _i9;
import '../data/source/local/user_local_data_source.dart' as _i18;
import '../data/source/remote/api/auth_api.dart' as _i3;
import '../data/source/remote/api/none_auth_api.dart' as _i8;
import '../data/source/remote/model/mapper/remote_image_url_data_mapper.dart'
    as _i10;
import '../data/source/remote/model/mapper/remote_token_data_mapper.dart'
    as _i11;
import '../data/source/remote/model/mapper/remote_user_data_mapper.dart'
    as _i12;
import '../data/source/remote/user_remote_data_source.dart' as _i15;
import '../domain/repository/user_repository.dart' as _i19;
import '../domain/usecase/clear_all_user_info_use_case.dart' as _i21;
import '../domain/usecase/get_current_user_use_case.dart' as _i22;
import '../domain/usecase/get_has_login_use_case.dart' as _i23;
import '../domain/usecase/get_users_use_case.dart' as _i24;
import '../domain/usecase/login_use_case.dart' as _i25;
import '../domain/usecase/logout_use_case.dart' as _i26;
import '../presentation/ui/app_bloc.dart' as _i27;
import '../presentation/ui/base/base_bloc.dart' as _i5;
import '../presentation/ui/home/home_bloc.dart' as _i28;
import '../presentation/ui/login/login_bloc.dart' as _i29;
import '../utils/deeplink/deep_link_manager.dart' as _i4;
import 'local_module.dart' as _i30; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final serviceModule = _$ServiceModule();
  gh.lazySingleton<_i3.AuthApi>(() => _i3.AuthApi());
  gh.lazySingleton<_i4.DeepLinkManager>(() => _i4.DeepLinkManager());
  gh.factory<_i5.EmptyBloc>(() => _i5.EmptyBloc());
  gh.factory<_i6.LocalImageUrlDataMapper>(() => _i6.LocalImageUrlDataMapper());
  gh.factory<_i7.LocalUserDataMapper>(() => _i7.LocalUserDataMapper());
  gh.lazySingleton<_i8.NoneAuthApi>(() => _i8.NoneAuthApi());
  gh.factory<_i9.PreferenceUserDataMapper>(
      () => _i9.PreferenceUserDataMapper());
  gh.factory<_i10.RemoteImageUrlDataMapper>(
      () => _i10.RemoteImageUrlDataMapper());
  gh.factory<_i11.RemoteTokenDataMapper>(() => _i11.RemoteTokenDataMapper());
  gh.factory<_i12.RemoteUserDataMapper>(
      () => _i12.RemoteUserDataMapper(get<_i10.RemoteImageUrlDataMapper>()));
  await gh.factoryAsync<_i13.SharedPreferences>(() => serviceModule.prefs,
      preResolve: true);
  await gh.factoryAsync<_i14.Store>(() => serviceModule.getStore(),
      preResolve: true);
  gh.lazySingleton<_i15.UserRemoteDataSource>(() => _i15.UserRemoteDataSource(
      get<_i8.NoneAuthApi>(),
      get<_i3.AuthApi>(),
      get<_i12.RemoteUserDataMapper>(),
      get<_i11.RemoteTokenDataMapper>()));
  gh.lazySingleton<_i16.AppPreferences>(
      () => _i16.AppPreferences(get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i17.DatabaseApi>(() => _i17.DatabaseApi(get<_i14.Store>()));
  gh.lazySingleton<_i18.UserLocalDataSource>(() => _i18.UserLocalDataSource(
      get<_i16.AppPreferences>(),
      get<_i17.DatabaseApi>(),
      get<_i7.LocalUserDataMapper>(),
      get<_i6.LocalImageUrlDataMapper>(),
      get<_i9.PreferenceUserDataMapper>()));
  gh.lazySingleton<_i19.UserRepository>(() => _i20.UserRepositoryImpl(
      get<_i15.UserRemoteDataSource>(), get<_i18.UserLocalDataSource>()));
  gh.factory<_i21.ClearAllUserInfoUseCase>(
      () => _i21.ClearAllUserInfoUseCase(get<_i19.UserRepository>()));
  gh.factory<_i22.GetCurrentUserUseCase>(
      () => _i22.GetCurrentUserUseCase(get<_i19.UserRepository>()));
  gh.factory<_i23.GetHasLoginUseCase>(
      () => _i23.GetHasLoginUseCase(get<_i19.UserRepository>()));
  gh.factory<_i24.GetUsersUseCase>(
      () => _i24.GetUsersUseCase(get<_i19.UserRepository>()));
  gh.factory<_i25.LoginUseCase>(
      () => _i25.LoginUseCase(get<_i19.UserRepository>()));
  gh.factory<_i26.LogoutUseCase>(
      () => _i26.LogoutUseCase(get<_i19.UserRepository>()));
  gh.lazySingleton<_i27.AppBloc>(() => _i27.AppBloc(
      get<_i21.ClearAllUserInfoUseCase>(), get<_i23.GetHasLoginUseCase>()));
  gh.factory<_i28.HomeBloc>(() => _i28.HomeBloc(
      get<_i26.LogoutUseCase>(), get<_i22.GetCurrentUserUseCase>()));
  gh.factory<_i29.LoginBloc>(() => _i29.LoginBloc(get<_i25.LoginUseCase>()));
  return get;
}

class _$ServiceModule extends _i30.ServiceModule {}
