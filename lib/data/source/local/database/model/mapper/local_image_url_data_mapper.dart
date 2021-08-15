import 'package:injectable/injectable.dart';

import '../local_image_url_data.dart';
import '../../../../../../domain/entity/image_url.dart';

import 'base/base_local_data_mapper.dart';

@Injectable()
class LocalImageUrlDataMapper extends BaseLocalDataMapper<LocalImageUrlData, ImageUrl>
    with LocalDataMapperMixin {
  @override
  ImageUrl mapToEntity(LocalImageUrlData data) {
    return ImageUrl(origin: data.origin, lg: data.lg, md: data.md, sm: data.sm);
  }

  @override
  LocalImageUrlData mapToLocalData(ImageUrl entity) {
    return LocalImageUrlData(origin: entity.origin, lg: entity.lg, md: entity.md, sm: entity.sm);
  }
}
