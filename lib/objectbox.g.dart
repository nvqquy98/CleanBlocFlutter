// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';

import 'data/source/local/database/model/local_image_url_data.dart';
import 'data/source/local/database/model/local_user_data.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(2, 7094704912726743070),
      name: 'LocalUserData',
      lastPropertyId: const IdUid(6, 8717361051687105203),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(2, 6082174241998237153),
            name: 'nickname',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 542836740865080823),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 508988078948518677),
            name: 'avatarId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 1110189464664554043),
            relationTarget: 'LocalImageUrlData'),
        ModelProperty(
            id: const IdUid(6, 8717361051687105203),
            name: 'id',
            type: 6,
            flags: 129)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 7019031084492999135),
      name: 'LocalImageUrlData',
      lastPropertyId: const IdUid(7, 4890809017638008412),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7846195092716424688),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7713289125578672723),
            name: 'origin',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2245974119045460429),
            name: 'lg',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4357742041611082275),
            name: 'md',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4037201549610151853),
            name: 'sm',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2454773752164474432),
            name: 'dbType',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4890809017638008412),
            name: 'recordId',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 7019031084492999135),
      lastIndexId: const IdUid(1, 1110189464664554043),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [1905785153244868761],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        6927018402651264995,
        7586338359400652592,
        5741726435581808738,
        4308156022452905242,
        719221736898602088,
        173584649470870568,
        2207712109475937150,
        3127996892851990155
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    LocalUserData: EntityDefinition<LocalUserData>(
        model: _entities[0],
        toOneRelations: (LocalUserData object) => [object.avatar],
        toManyRelations: (LocalUserData object) => {},
        getId: (LocalUserData object) => object.id,
        setId: (LocalUserData object, int id) {
          object.id = id;
        },
        objectToFB: (LocalUserData object, fb.Builder fbb) {
          final nicknameOffset = fbb.writeString(object.nickname);
          final emailOffset = fbb.writeString(object.email);
          fbb.startTable(7);
          fbb.addOffset(1, nicknameOffset);
          fbb.addOffset(2, emailOffset);
          fbb.addInt64(3, object.avatar.targetId);
          fbb.addInt64(5, object.id);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LocalUserData(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0),
              nickname:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              email:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''));
          object.avatar.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.avatar.attach(store);
          return object;
        }),
    LocalImageUrlData: EntityDefinition<LocalImageUrlData>(
        model: _entities[1],
        toOneRelations: (LocalImageUrlData object) => [],
        toManyRelations: (LocalImageUrlData object) => {},
        getId: (LocalImageUrlData object) => object.id,
        setId: (LocalImageUrlData object, int id) {
          object.id = id;
        },
        objectToFB: (LocalImageUrlData object, fb.Builder fbb) {
          final originOffset = fbb.writeString(object.origin);
          final lgOffset = fbb.writeString(object.lg);
          final mdOffset = fbb.writeString(object.md);
          final smOffset = fbb.writeString(object.sm);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, originOffset);
          fbb.addOffset(2, lgOffset);
          fbb.addOffset(3, mdOffset);
          fbb.addOffset(4, smOffset);
          fbb.addInt64(5, object.dbType);
          fbb.addInt64(6, object.recordId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LocalImageUrlData(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              recordId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0),
              origin:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              lg: const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              md: const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              sm: const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''))
            ..dbType =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [LocalUserData] entity fields to define ObjectBox queries.
class LocalUserData_ {
  /// see [LocalUserData.nickname]
  static final nickname =
      QueryStringProperty<LocalUserData>(_entities[0].properties[0]);

  /// see [LocalUserData.email]
  static final email =
      QueryStringProperty<LocalUserData>(_entities[0].properties[1]);

  /// see [LocalUserData.avatar]
  static final avatar = QueryRelationProperty<LocalUserData, LocalImageUrlData>(
      _entities[0].properties[2]);

  /// see [LocalUserData.id]
  static final id =
      QueryIntegerProperty<LocalUserData>(_entities[0].properties[3]);
}

/// [LocalImageUrlData] entity fields to define ObjectBox queries.
class LocalImageUrlData_ {
  /// see [LocalImageUrlData.id]
  static final id =
      QueryIntegerProperty<LocalImageUrlData>(_entities[1].properties[0]);

  /// see [LocalImageUrlData.origin]
  static final origin =
      QueryStringProperty<LocalImageUrlData>(_entities[1].properties[1]);

  /// see [LocalImageUrlData.lg]
  static final lg =
      QueryStringProperty<LocalImageUrlData>(_entities[1].properties[2]);

  /// see [LocalImageUrlData.md]
  static final md =
      QueryStringProperty<LocalImageUrlData>(_entities[1].properties[3]);

  /// see [LocalImageUrlData.sm]
  static final sm =
      QueryStringProperty<LocalImageUrlData>(_entities[1].properties[4]);

  /// see [LocalImageUrlData.dbType]
  static final dbType =
      QueryIntegerProperty<LocalImageUrlData>(_entities[1].properties[5]);

  /// see [LocalImageUrlData.recordId]
  static final recordId =
      QueryIntegerProperty<LocalImageUrlData>(_entities[1].properties[6]);
}
