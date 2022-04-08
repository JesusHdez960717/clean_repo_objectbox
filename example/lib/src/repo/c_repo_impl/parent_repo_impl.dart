import 'dart:async';

import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ParentRepoImpl
    extends DefaultCRUDRepo<ParentDomain, ParentEntity, ParentRepoExternal>
    implements ParentRepo {
  ParentRepoImpl(ParentRepoExternal repo)
      : super(externalRepo: repo, converter: ParentConverter.converter);

  StreamController<List<ParentDomain>> streamController() {
    final _listController = StreamController<List<ParentDomain>>(sync: true);
    Stream<List<ParentDomain>> stream = externalRepo.box
        .query()
        .watch(triggerImmediately: true)
        .map((q) => ParentConverter.converter.toDomainAll(q.find()));
    _listController.addStream(stream);
    return _listController;
  }

  Stream<List<ParentDomain>> stream() {
    return externalRepo.box
        .query()
        .watch(triggerImmediately: true)
        .map((q) => ParentConverter.converter.toDomainAll(q.find()));
  }
}

class ParentConverter extends GeneralConverter<ParentDomain, ParentEntity> {
  static final ParentConverter converter = ParentConverter._();

  ParentConverter._();

  @override
  ParentDomain toDomain(ParentEntity entity) {
    return ParentDomain(
      name: entity.name,
      bornDay: entity.bornDay,
      id: entity.id,
    );
  }

  @override
  ParentEntity toEntity(ParentDomain domain) {
    return ParentEntity(
      domain.name,
      domain.bornDay,
      id: domain.id,
    );
  }
}
