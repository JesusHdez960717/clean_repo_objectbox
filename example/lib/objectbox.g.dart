// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'repo/b_entities/Entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7640212212430165525),
      name: 'ChildEntity',
      lastPropertyId: const IdUid(3, 5613571069985664983),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7655155972333682733),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3694810900544660690),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5613571069985664983),
            name: 'parentFKId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 6733544651472391800),
            relationTarget: 'ParentEntity')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5708363993491732527),
      name: 'ParentEntity',
      lastPropertyId: const IdUid(3, 395486208661296490),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2445730450581400103),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1096160155796008297),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 395486208661296490),
            name: 'bornDay',
            type: 10,
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
      lastEntityId: const IdUid(2, 5708363993491732527),
      lastIndexId: const IdUid(1, 6733544651472391800),
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
    ChildEntity: EntityDefinition<ChildEntity>(
        model: _entities[0],
        toOneRelations: (ChildEntity object) => [object.parentFK],
        toManyRelations: (ChildEntity object) => {},
        getId: (ChildEntity object) => object.id,
        setId: (ChildEntity object, int id) {
          object.id = id;
        },
        objectToFB: (ChildEntity object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.parentFK.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChildEntity(
              const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          object.parentFK.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.parentFK.attach(store);
          return object;
        }),
    ParentEntity: EntityDefinition<ParentEntity>(
        model: _entities[1],
        toOneRelations: (ParentEntity object) => [],
        toManyRelations: (ParentEntity object) => {},
        getId: (ParentEntity object) => object.id,
        setId: (ParentEntity object, int id) {
          object.id = id;
        },
        objectToFB: (ParentEntity object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.bornDay.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ParentEntity(
              const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ChildEntity] entity fields to define ObjectBox queries.
class ChildEntity_ {
  /// see [ChildEntity.id]
  static final id =
      QueryIntegerProperty<ChildEntity>(_entities[0].properties[0]);

  /// see [ChildEntity.name]
  static final name =
      QueryStringProperty<ChildEntity>(_entities[0].properties[1]);

  /// see [ChildEntity.parentFK]
  static final parentFK =
      QueryRelationToOne<ChildEntity, ParentEntity>(_entities[0].properties[2]);
}

/// [ParentEntity] entity fields to define ObjectBox queries.
class ParentEntity_ {
  /// see [ParentEntity.id]
  static final id =
      QueryIntegerProperty<ParentEntity>(_entities[1].properties[0]);

  /// see [ParentEntity.name]
  static final name =
      QueryStringProperty<ParentEntity>(_entities[1].properties[1]);

  /// see [ParentEntity.bornDay]
  static final bornDay =
      QueryIntegerProperty<ParentEntity>(_entities[1].properties[2]);
}
