# basecleanflutter

A base Flutter application using clean architecture and bloc pattern developed by nguyen.thanh.minh-b@sun-asterisk.com

## v2 CHANGE_LOG
- Demo nested navigation using Auto Route [MainScreen]
- Use Provider to pass bloc to child widget in same screen [LoginScreen]
- Use ChangeNotifierProvider.value to pass bloc from first screen to second screen [MainScreen to MapScreen]
- Use Provider wrap MaterialApp to share bloc in whole app [ProfileSharedBloc]
- Use Provider wrap MainScreen to share bloc in MainScreen and its child screens [MainBloc]
- Share bloc between [UsersBottomSheet] and [HomeDetailScreen] and [MainScreen]
- Demo DarkMode in [SettingsScreen]
- Demo cancel previous, queue api, ... in [SettingsBloc]
- Use DartX package: Collection extensions, String extensions
- Pop all screens until root when reselect BottomBarTab, Scroll to top when reselect BottomBarTab in root screen
- Fix base loading when call multi api in parallel
- Fix DisposeBag
- StreamController: Use [addSafely] extension method instead of [add] method

## Commands

- Gen splash using [flutter_native_splash] package: flutter pub run flutter_native_splash:create
- Gen DB, navigation, data class, DI: flutter packages pub run build_runner watch --delete-conflicting-outputs

## Getting Started

- Run above commands to gen files
- config api: api_config.dart
- config database: database_config.dart
- config deeplink: android (AndroidManifest.xml), ios (Info.plist), ref: https://pub.dev/packages/uni_links

## Features

- DI: get_it, injectable
- data class: freezed
- navigation: auto_route
- deeplink: uni_links
- DB: objectbox (can be replaced by floor / moor)
- Network API: dio
- Pattern: Bloc + RxDart

