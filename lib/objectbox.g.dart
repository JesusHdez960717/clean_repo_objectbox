// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/repo/objectbox/key_value_repo/data/entity/key_value_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2881626965864008822),
      name: 'KeyValueEntity',
      lastPropertyId: const IdUid(3, 785379303733882058),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4373838254075003834),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8997350121004715041),
            name: 'key',
            type: 9,
            flags: 34848,
            indexId: const IdUid(1, 7356114923904760)),
        ModelProperty(
            id: const IdUid(3, 785379303733882058),
            name: 'value',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 2881626965864008822),
      lastIndexId: const IdUid(1, 7356114923904760),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    KeyValueEntity: EntityDefinition<KeyValueEntity>(
        model: _entities[0],
        toOneRelations: (KeyValueEntity object) => [],
        toManyRelations: (KeyValueEntity object) => {},
        getId: (KeyValueEntity object) => object.id,
        setId: (KeyValueEntity object, int id) {
          object.id = id;
        },
        objectToFB: (KeyValueEntity object, fb.Builder fbb) {
          final keyOffset = fbb.writeString(object.key);
          final valueOffset = fbb.writeString(object.value);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, keyOffset);
          fbb.addOffset(2, valueOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = KeyValueEntity(
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [KeyValueEntity] entity fields to define ObjectBox queries.
class KeyValueEntity_ {
  /// see [KeyValueEntity.id]
  static final id =
      QueryIntegerProperty<KeyValueEntity>(_entities[0].properties[0]);

  /// see [KeyValueEntity.key]
  static final key =
      QueryStringProperty<KeyValueEntity>(_entities[0].properties[1]);

  /// see [KeyValueEntity.value]
  static final value =
      QueryStringProperty<KeyValueEntity>(_entities[0].properties[2]);
}
