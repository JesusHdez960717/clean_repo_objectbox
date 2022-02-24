// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/repo/b_entities/entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3495066968911145424),
      name: 'ChildEntity',
      lastPropertyId: const IdUid(3, 8641405352430002326),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 217491309248229772),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5241512759374396314),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8641405352430002326),
            name: 'parentFKId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 7416905356186923221),
            relationTarget: 'ParentEntity')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 7109991978524603100),
      name: 'ParentEntity',
      lastPropertyId: const IdUid(3, 824895190430008406),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2799924688484374424),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8454286627245417183),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 824895190430008406),
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
      lastEntityId: const IdUid(2, 7109991978524603100),
      lastIndexId: const IdUid(1, 7416905356186923221),
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
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
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
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
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
