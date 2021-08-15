import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<File?> getImageFileFromUrl(String imageUrl) async {
  try {
    return DefaultCacheManager().getSingleFile(imageUrl);
  } catch (_) {
    return null;
  }
}
