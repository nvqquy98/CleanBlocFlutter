import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_pages.freezed.dart';

/// support Web platform
@freezed
class AppPage with _$AppPage {
  const factory AppPage.unknown() = _Unknown;

  const factory AppPage.initial() = _Initial;

  const factory AppPage.loginOptions() = _LoginOptions;

  const factory AppPage.login() = _Login;

  const factory AppPage.home() = _Home;

  const factory AppPage.main() = _Main;

  const factory AppPage.homeDetail(int id) = _HomeDetail;

  const factory AppPage.profile() = _Profile;

  const factory AppPage.editProfile() = _EditProfile;

  const factory AppPage.gallery() = _Gallery;

  const factory AppPage.settings() = _Settings;

  const factory AppPage.resetPassword(String resetPasswordToken) =
      _ResetPassword;
}

/// support Web platform
class PagePrefixPath {
  const PagePrefixPath._();

  factory PagePrefixPath() => const PagePrefixPath._();
  static const login = '/login';
  static const loginOptions = '/loginOptions';
  static const home = '/home';
  static const main = '/main';
  static const profile = '/profile';
  static const editProfile = '/editProfile';
  static const gallery = '/gallery';
  static const settings = '/settings';
  static const resetPassword = '/resetPassword';
}
