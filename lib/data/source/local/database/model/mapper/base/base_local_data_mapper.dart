import '../../../../../../../domain/entity/base/base_entity.dart';
import '../../base/base_local_data.dart';

abstract class BaseLocalDataMapper<L extends BaseLocalData, E extends BaseEntity> {
  E mapToEntity(L data);

  List<E> mapToListEntity(List<L> listData) {
    return listData.map(mapToEntity).toList();
  }
}

mixin LocalDataMapperMixin<L extends BaseLocalData, E extends BaseEntity>
    on BaseLocalDataMapper<L, E> {
  L mapToLocalData(E entity);

  List<L> mapToListLocalData(List<E> listEntity) {
    return listEntity.map(mapToLocalData).toList();
  }
}
