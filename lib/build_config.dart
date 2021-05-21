import 'package:package_info/package_info.dart';

class BuildConfig {
  static Flavor flavor = Flavor.develop;
  static String versionName = '';
  static String versionCode = '';
  static String applicationId = '';

  Future<String> getVersionName() async {
    if (versionName.isNotEmpty) return versionName;
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionName = packageInfo.version;
    return packageInfo.version;
  }

  /// android: version code, ios: build
  Future<String> getVersionCode() async {
    if (versionCode.isNotEmpty) return versionCode;
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    versionCode = packageInfo.buildNumber;
    return packageInfo.buildNumber;
  }

  Future<String> getPackageName() async {
    if (applicationId.isNotEmpty) return applicationId;
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    applicationId = packageInfo.packageName;
    return packageInfo.packageName;
  }
}

enum Flavor { develop, staging, production }