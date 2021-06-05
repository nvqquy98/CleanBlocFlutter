// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:objectbox/objectbox.dart' as _i27;
import 'package:shared_preferences/shared_preferences.dart' as _i23;

import '../data/repository/app_repository_impl.dart' as _i37;
import '../data/repository/station_repository_impl.dart' as _i26;
import '../data/repository/user_repository_impl.dart' as _i34;
import '../data/source/local/app_local_data_source.dart' as _i35;
import '../data/source/local/database/database_api.dart' as _i31;
import '../data/source/local/database/model/mapper/local_image_url_data_mapper.dart'
    as _i9;
import '../data/source/local/database/model/mapper/local_user_data_mapper.dart'
    as _i10;
import '../data/source/local/preference/app_preferences.dart' as _i30;
import '../data/source/local/preference/model/mapper/preference_user_data_mapper.dart'
    as _i14;
import '../data/source/local/user_local_data_source.dart' as _i32;
import '../data/source/remote/api/auth_api.dart' as _i3;
import '../data/source/remote/api/none_auth_api.dart' as _i13;
import '../data/source/remote/model/mapper/remote_image_url_data_mapper.dart'
    as _i17;
import '../data/source/remote/model/mapper/remote_notification_data_mapper.dart'
    as _i18;
import '../data/source/remote/model/mapper/remote_road_data_mapper.dart'
    as _i19;
import '../data/source/remote/model/mapper/remote_station_data_mapper.dart'
    as _i20;
import '../data/source/remote/model/mapper/remote_token_data_mapper.dart'
    as _i21;
import '../data/source/remote/model/mapper/remote_user_data_mapper.dart'
    as _i22;
import '../data/source/remote/station_remote_data_source.dart' as _i24;
import '../data/source/remote/user_remote_data_source.dart' as _i28;
import '../domain/repository/app_repository.dart' as _i36;
import '../domain/repository/station_repository.dart' as _i25;
import '../domain/repository/user_repository.dart' as _i33;
import '../domain/usecase/clear_all_user_info_use_case.dart' as _i38;
import '../domain/usecase/get_current_user_use_case.dart' as _i39;
import '../domain/usecase/get_has_login_use_case.dart' as _i40;
import '../domain/usecase/get_users_use_case.dart' as _i41;
import '../domain/usecase/is_dark_mode_use_case.dart' as _i42;
import '../domain/usecase/login_use_case.dart' as _i43;
import '../domain/usecase/logout_use_case.dart' as _i44;
import '../domain/usecase/save_device_token_use_case.dart' as _i45;
import '../domain/usecase/save_is_dark_mode_use_case.dart' as _i46;
import '../presentation/helper/deeplink/deep_link_manager.dart' as _i4;
import '../presentation/helper/firebase_messaging/firebase_messaging_manager.dart'
    as _i49;
import '../presentation/ui/app_bloc.dart' as _i48;
import '../presentation/ui/edit_profile/edit_profile_bloc.dart' as _i5;
import '../presentation/ui/edit_profile/profile_shared_bloc.dart' as _i16;
import '../presentation/ui/gallery/gallery_bloc.dart' as _i6;
import '../presentation/ui/home/home_bloc.dart' as _i7;
import '../presentation/ui/home_detail/home_detail_bloc.dart' as _i8;
import '../presentation/ui/login/login_bloc.dart' as _i50;
import '../presentation/ui/main/main_bloc.dart' as _i11;
import '../presentation/ui/map/map_bloc.dart' as _i12;
import '../presentation/ui/profile/profile_bloc.dart' as _i15;
import '../presentation/ui/setting/settings_bloc.dart' as _i47;
import '../presentation/ui/users/users_bloc.dart' as _i29;
import 'local_module.dart' as _i51; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final serviceModule = _$ServiceModule();
  gh.lazySingleton<_i3.AuthApi>(() => _i3.AuthApi());
  gh.lazySingleton<_i4.DeepLinkManager>(() => _i4.DeepLinkManager());
  gh.factory<_i5.EditProfileBloc>(() => _i5.EditProfileBloc());
  gh.factory<_i6.GalleryBloc>(() => _i6.GalleryBloc());
  gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc());
  gh.factory<_i8.HomeDetailBloc>(() => _i8.HomeDetailBloc());
  gh.factory<_i9.LocalImageUrlDataMapper>(() => _i9.LocalImageUrlDataMapper());
  gh.factory<_i10.LocalUserDataMapper>(() => _i10.LocalUserDataMapper());
  gh.factory<_i11.MainBloc>(() => _i11.MainBloc());
  gh.factory<_i12.MapBloc>(() => _i12.MapBloc());
  gh.lazySingleton<_i13.NoneAuthApi>(() => _i13.NoneAuthApi());
  gh.factory<_i14.PreferenceUserDataMapper>(
      () => _i14.PreferenceUserDataMapper());
  gh.factory<_i15.ProfileBloc>(() => _i15.ProfileBloc());
  gh.factory<_i16.ProfileSharedBloc>(() => _i16.ProfileSharedBloc());
  gh.factory<_i17.RemoteImageUrlDataMapper>(
      () => _i17.RemoteImageUrlDataMapper());
  gh.factory<_i18.RemoteNotificationDataMapper>(
      () => _i18.RemoteNotificationDataMapper());
  gh.factory<_i19.RemoteRoadDataMapper>(() => _i19.RemoteRoadDataMapper());
  gh.factory<_i20.RemoteStationDataMapper>(
      () => _i20.RemoteStationDataMapper());
  gh.factory<_i21.RemoteTokenDataMapper>(() => _i21.RemoteTokenDataMapper());
  gh.factory<_i22.RemoteUserDataMapper>(
      () => _i22.RemoteUserDataMapper(get<_i17.RemoteImageUrlDataMapper>()));
  await gh.factoryAsync<_i23.SharedPreferences>(() => serviceModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i24.StationRemoteDataSource>(
      () => _i24.StationRemoteDataSource(get<_i3.AuthApi>()));
  gh.lazySingleton<_i25.StationRepository>(() => _i26.StationRepositoryImpl(
      get<_i24.StationRemoteDataSource>(),
      get<_i19.RemoteRoadDataMapper>(),
      get<_i20.RemoteStationDataMapper>()));
  await gh.factoryAsync<_i27.Store>(() => serviceModule.getStore(),
      preResolve: true);
  gh.lazySingleton<_i28.UserRemoteDataSource>(() => _i28.UserRemoteDataSource(
      get<_i13.NoneAuthApi>(),
      get<_i3.AuthApi>(),
      get<_i22.RemoteUserDataMapper>(),
      get<_i21.RemoteTokenDataMapper>()));
  gh.factory<_i29.UsersBloc>(() => _i29.UsersBloc());
  gh.lazySingleton<_i30.AppPreferences>(
      () => _i30.AppPreferences(get<_i23.SharedPreferences>()));
  gh.lazySingleton<_i31.DatabaseApi>(() => _i31.DatabaseApi(get<_i27.Store>()));
  gh.lazySingleton<_i32.UserLocalDataSource>(() => _i32.UserLocalDataSource(
      get<_i30.AppPreferences>(),
      get<_i31.DatabaseApi>(),
      get<_i10.LocalUserDataMapper>(),
      get<_i9.LocalImageUrlDataMapper>(),
      get<_i14.PreferenceUserDataMapper>()));
  gh.lazySingleton<_i33.UserRepository>(() => _i34.UserRepositoryImpl(
      get<_i28.UserRemoteDataSource>(), get<_i32.UserLocalDataSource>()));
  gh.lazySingleton<_i35.AppLocalDataSource>(
      () => _i35.AppLocalDataSource(get<_i30.AppPreferences>()));
  gh.lazySingleton<_i36.AppRepository>(
      () => _i37.AppRepositoryImpl(get<_i35.AppLocalDataSource>()));
  gh.factory<_i38.ClearAllUserInfoUseCase>(
      () => _i38.ClearAllUserInfoUseCase(get<_i33.UserRepository>()));
  gh.factory<_i39.GetCurrentUserUseCase>(
      () => _i39.GetCurrentUserUseCase(get<_i33.UserRepository>()));
  gh.factory<_i40.GetHasLoginUseCase>(
      () => _i40.GetHasLoginUseCase(get<_i33.UserRepository>()));
  gh.factory<_i41.GetUsersUseCase>(
      () => _i41.GetUsersUseCase(get<_i33.UserRepository>()));
  gh.factory<_i42.IsDarkModeUseCase>(
      () => _i42.IsDarkModeUseCase(get<_i36.AppRepository>()));
  gh.factory<_i43.LoginUseCase>(
      () => _i43.LoginUseCase(get<_i33.UserRepository>()));
  gh.factory<_i44.LogoutUseCase>(
      () => _i44.LogoutUseCase(get<_i33.UserRepository>()));
  gh.factory<_i45.SaveDeviceTokenUseCase>(
      () => _i45.SaveDeviceTokenUseCase(get<_i33.UserRepository>()));
  gh.factory<_i46.SaveIsDarkModeUseCase>(
      () => _i46.SaveIsDarkModeUseCase(get<_i36.AppRepository>()));
  gh.factory<_i47.SettingsBloc>(() => _i47.SettingsBloc(
      get<_i44.LogoutUseCase>(), get<_i39.GetCurrentUserUseCase>()));
  gh.lazySingleton<_i48.AppBloc>(() => _i48.AppBloc(
      get<_i38.ClearAllUserInfoUseCase>(),
      get<_i40.GetHasLoginUseCase>(),
      get<_i42.IsDarkModeUseCase>(),
      get<_i46.SaveIsDarkModeUseCase>()));
  gh.lazySingleton<_i49.FirebaseMessagingManager>(() =>
      _i49.FirebaseMessagingManager(get<_i45.SaveDeviceTokenUseCase>(),
          get<_i18.RemoteNotificationDataMapper>()));
  gh.factory<_i50.LoginBloc>(() => _i50.LoginBloc(get<_i43.LoginUseCase>()));
  return get;
}

class _$ServiceModule extends _i51.ServiceModule {}
