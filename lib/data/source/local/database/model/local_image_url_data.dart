import 'package:objectbox/objectbox.dart';

import 'base_local_data.dart';

@Entity()
class LocalImageUrlData extends BaseLocalData {
  int id;
  LocalImageUrlType type;
  int recordId;
  String origin;
  String lg;
  String md;
  String sm;

  LocalImageUrlData(
      {this.id = 0,
      this.type = LocalImageUrlType.unknown,
      this.recordId = -1,
      this.origin = '',
      this.lg = '',
      this.md = '',
      this.sm = ''});

  int get dbType {
    switch (type) {
      case LocalImageUrlType.userAvatar:
        return LocalImageUrlType.userAvatar.index;
      case LocalImageUrlType.postImage:
        return LocalImageUrlType.postImage.index;
      default:
        return -1;
    }
  }

  set dbType(int? value) {
    if (value == LocalImageUrlType.userAvatar.index) {
      type = LocalImageUrlType.userAvatar;
    } else if (value == LocalImageUrlType.postImage.index) {
      type = LocalImageUrlType.postImage;
    }
  }
}

enum LocalImageUrlType { unknown, userAvatar, userWallImage, postImage }
