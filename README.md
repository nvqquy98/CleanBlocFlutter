# basecleanflutter

A base Flutter application using clean architecture and bloc pattern developed by nguyen.thanh.minh-b@sun-asterisk.com

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

