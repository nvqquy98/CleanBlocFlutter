import 'package:meta/meta.dart';

class PagePrefixPath {
  const PagePrefixPath._();

  factory PagePrefixPath() => const PagePrefixPath._();
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const main = '/main';
  static const profile = '/profile';
  static const editProfile = '/editProfile';
  static const gallery = '/gallery';
  static const resetPassword = '/resetPassword';
}

@sealed
abstract class AppPage {
  final String path;

  const AppPage(this.path);
}

class SplashPage extends AppPage {
  const SplashPage() : super(PagePrefixPath.splash);
}

class LoginPage extends AppPage {
  const LoginPage() : super(PagePrefixPath.login);
}

class MainPage extends AppPage {
  const MainPage() : super(PagePrefixPath.main);
}

class HomePage extends AppPage {
  const HomePage() : super(PagePrefixPath.home);
}

class ProfilePage extends AppPage {
  const ProfilePage() : super(PagePrefixPath.profile);
}

class EditProfilePage extends AppPage {
  const EditProfilePage() : super(PagePrefixPath.editProfile);
}

class GalleryPage extends AppPage {
  const GalleryPage() : super(PagePrefixPath.gallery);
}

class ResetPasswordPage extends AppPage {
  const ResetPasswordPage() : super(PagePrefixPath.resetPassword);
}
