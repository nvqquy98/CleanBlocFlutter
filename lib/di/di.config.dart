// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:objectbox/objectbox.dart' as _i24;
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '../data/repository/app_repository_impl.dart' as _i36;
import '../data/repository/user_repository_impl.dart' as _i33;
import '../data/source/local/app_local_data_source.dart' as _i34;
import '../data/source/local/database/dao/user_dao.dart' as _i25;
import '../data/source/local/database/database_api.dart' as _i29;
import '../data/source/local/database/model/mapper/local_image_url_data_mapper.dart'
    as _i11;
import '../data/source/local/database/model/mapper/local_user_data_mapper.dart'
    as _i12;
import '../data/source/local/preference/app_preferences.dart' as _i28;
import '../data/source/local/preference/model/mapper/preference_user_data_mapper.dart'
    as _i15;
import '../data/source/local/user_local_data_source.dart' as _i30;
import '../data/source/remote/api/error/http_request_exception_mapper.dart'
    as _i10;
import '../data/source/remote/api/services/refresh_token_service.dart' as _i18;
import '../data/source/remote/api/services/user_service.dart' as _i26;
import '../data/source/remote/model/mapper/error_response_detail_mapper.dart'
    as _i5;
import '../data/source/remote/model/mapper/error_response_mapper.dart' as _i6;
import '../data/source/remote/model/mapper/remote_image_url_data_mapper.dart'
    as _i19;
import '../data/source/remote/model/mapper/remote_notification_data_mapper.dart'
    as _i20;
import '../data/source/remote/model/mapper/remote_token_data_mapper.dart'
    as _i21;
import '../data/source/remote/model/mapper/remote_user_data_mapper.dart'
    as _i22;
import '../data/source/remote/user_remote_data_source.dart' as _i31;
import '../domain/repository/app_repository.dart' as _i35;
import '../domain/repository/user_repository.dart' as _i32;
import '../domain/usecase/clear_all_user_info_use_case.dart' as _i37;
import '../domain/usecase/get_current_user_use_case.dart' as _i38;
import '../domain/usecase/get_has_login_use_case.dart' as _i39;
import '../domain/usecase/get_users_use_case.dart' as _i40;
import '../domain/usecase/is_dark_mode_use_case.dart' as _i41;
import '../domain/usecase/login_use_case.dart' as _i42;
import '../domain/usecase/logout_use_case.dart' as _i43;
import '../domain/usecase/save_device_token_use_case.dart' as _i44;
import '../domain/usecase/save_is_dark_mode_use_case.dart' as _i45;
import '../presentation/helper/deeplink/deep_link_manager.dart' as _i3;
import '../presentation/helper/firebase_messaging/firebase_messaging_manager.dart'
    as _i48;
import '../presentation/ui/app_bloc.dart' as _i47;
import '../presentation/ui/edit_profile/edit_profile_bloc.dart' as _i4;
import '../presentation/ui/edit_profile/profile_shared_bloc.dart' as _i17;
import '../presentation/ui/gallery/gallery_bloc.dart' as _i7;
import '../presentation/ui/home/home_bloc.dart' as _i8;
import '../presentation/ui/home_detail/home_detail_bloc.dart' as _i9;
import '../presentation/ui/login/login_bloc.dart' as _i49;
import '../presentation/ui/main/main_bloc.dart' as _i13;
import '../presentation/ui/map/map_bloc.dart' as _i14;
import '../presentation/ui/profile/profile_bloc.dart' as _i16;
import '../presentation/ui/setting/settings_bloc.dart' as _i46;
import '../presentation/ui/users/users_bloc.dart' as _i27;
import 'local_module.dart' as _i50; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final serviceModule = _$ServiceModule();
  gh.lazySingleton<_i3.DeepLinkManager>(() => _i3.DeepLinkManager());
  gh.factory<_i4.EditProfileBloc>(() => _i4.EditProfileBloc());
  gh.factory<_i5.ErrorResponseDetailMapper>(
      () => _i5.ErrorResponseDetailMapper());
  gh.factory<_i6.ErrorResponseMapper>(
      () => _i6.ErrorResponseMapper(get<_i5.ErrorResponseDetailMapper>()));
  gh.factory<_i7.GalleryBloc>(() => _i7.GalleryBloc());
  gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc());
  gh.factory<_i9.HomeDetailBloc>(() => _i9.HomeDetailBloc());
  gh.factory<_i10.HttpRequestExceptionMapper>(
      () => _i10.HttpRequestExceptionMapper(get<_i6.ErrorResponseMapper>()));
  gh.factory<_i11.LocalImageUrlDataMapper>(
      () => _i11.LocalImageUrlDataMapper());
  gh.factory<_i12.LocalUserDataMapper>(() => _i12.LocalUserDataMapper());
  gh.factory<_i13.MainBloc>(() => _i13.MainBloc());
  gh.factory<_i14.MapBloc>(() => _i14.MapBloc());
  gh.factory<_i15.PreferenceUserDataMapper>(
      () => _i15.PreferenceUserDataMapper());
  gh.factory<_i16.ProfileBloc>(() => _i16.ProfileBloc());
  gh.factory<_i17.ProfileSharedBloc>(() => _i17.ProfileSharedBloc());
  gh.lazySingleton<_i18.RefreshTokenService>(() => _i18.RefreshTokenService());
  gh.factory<_i19.RemoteImageUrlDataMapper>(
      () => _i19.RemoteImageUrlDataMapper());
  gh.factory<_i20.RemoteNotificationDataMapper>(
      () => _i20.RemoteNotificationDataMapper());
  gh.factory<_i21.RemoteTokenDataMapper>(() => _i21.RemoteTokenDataMapper());
  gh.factory<_i22.RemoteUserDataMapper>(
      () => _i22.RemoteUserDataMapper(get<_i19.RemoteImageUrlDataMapper>()));
  await gh.factoryAsync<_i23.SharedPreferences>(() => serviceModule.prefs,
      preResolve: true);
  await gh.factoryAsync<_i24.Store>(() => serviceModule.getStore(),
      preResolve: true);
  gh.lazySingleton<_i25.UserDao>(() => _i25.UserDao());
  gh.lazySingleton<_i26.UserService>(() => _i26.UserService());
  gh.factory<_i27.UsersBloc>(() => _i27.UsersBloc());
  gh.lazySingleton<_i28.AppPreferences>(
      () => _i28.AppPreferences(get<_i23.SharedPreferences>()));
  gh.lazySingleton<_i29.DatabaseApi>(() => _i29.DatabaseApi(get<_i24.Store>()));
  gh.lazySingleton<_i30.UserLocalDataSource>(() => _i30.UserLocalDataSource(
      get<_i28.AppPreferences>(),
      get<_i25.UserDao>(),
      get<_i12.LocalUserDataMapper>(),
      get<_i11.LocalImageUrlDataMapper>(),
      get<_i15.PreferenceUserDataMapper>()));
  gh.lazySingleton<_i31.UserRemoteDataSource>(() => _i31.UserRemoteDataSource(
      get<_i26.UserService>(),
      get<_i22.RemoteUserDataMapper>(),
      get<_i21.RemoteTokenDataMapper>()));
  gh.lazySingleton<_i32.UserRepository>(() => _i33.UserRepositoryImpl(
      get<_i31.UserRemoteDataSource>(), get<_i30.UserLocalDataSource>()));
  gh.lazySingleton<_i34.AppLocalDataSource>(
      () => _i34.AppLocalDataSource(get<_i28.AppPreferences>()));
  gh.lazySingleton<_i35.AppRepository>(
      () => _i36.AppRepositoryImpl(get<_i34.AppLocalDataSource>()));
  gh.factory<_i37.ClearAllUserInfoUseCase>(
      () => _i37.ClearAllUserInfoUseCase(get<_i32.UserRepository>()));
  gh.factory<_i38.GetCurrentUserUseCase>(
      () => _i38.GetCurrentUserUseCase(get<_i32.UserRepository>()));
  gh.factory<_i39.GetHasLoginUseCase>(
      () => _i39.GetHasLoginUseCase(get<_i32.UserRepository>()));
  gh.factory<_i40.GetUsersUseCase>(
      () => _i40.GetUsersUseCase(get<_i32.UserRepository>()));
  gh.factory<_i41.IsDarkModeUseCase>(
      () => _i41.IsDarkModeUseCase(get<_i35.AppRepository>()));
  gh.factory<_i42.LoginUseCase>(
      () => _i42.LoginUseCase(get<_i32.UserRepository>()));
  gh.factory<_i43.LogoutUseCase>(
      () => _i43.LogoutUseCase(get<_i32.UserRepository>()));
  gh.factory<_i44.SaveDeviceTokenUseCase>(
      () => _i44.SaveDeviceTokenUseCase(get<_i32.UserRepository>()));
  gh.factory<_i45.SaveIsDarkModeUseCase>(
      () => _i45.SaveIsDarkModeUseCase(get<_i35.AppRepository>()));
  gh.factory<_i46.SettingsBloc>(() => _i46.SettingsBloc(
      get<_i43.LogoutUseCase>(), get<_i38.GetCurrentUserUseCase>()));
  gh.lazySingleton<_i47.AppBloc>(() => _i47.AppBloc(
      get<_i37.ClearAllUserInfoUseCase>(),
      get<_i39.GetHasLoginUseCase>(),
      get<_i41.IsDarkModeUseCase>(),
      get<_i45.SaveIsDarkModeUseCase>()));
  gh.lazySingleton<_i48.FirebaseMessagingManager>(() =>
      _i48.FirebaseMessagingManager(get<_i44.SaveDeviceTokenUseCase>(),
          get<_i20.RemoteNotificationDataMapper>()));
  gh.factory<_i49.LoginBloc>(() => _i49.LoginBloc(get<_i42.LoginUseCase>()));
  return get;
}

class _$ServiceModule extends _i50.ServiceModule {}
