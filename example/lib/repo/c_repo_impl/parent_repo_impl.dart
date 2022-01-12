import 'dart:async';
import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/app/objectbox_app_exporter.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';

class ParentRepoImpl extends DefaultCRUDRepo<ParentDomain, ParentEntity>
    implements ParentRepo {
  late ParentRepoExternal _external;

  ParentRepoImpl(ParentRepoExternal repo)
      : super(externalRepo: repo, converter: ParentEntity.CONVERTER) {
    _external = repo;
  }

  StreamController<List<ParentDomain>> streamController() {
    final _listController = StreamController<List<ParentDomain>>(sync: true);
    Stream<List<ParentDomain>> stream = _external.box
        .query()
        .watch(triggerImmediately: true)
        .map((q) => ParentEntity.CONVERTER.toDomainAll(q.find()));
    _listController.addStream(stream);
    return _listController;
  }

  Stream<List<ParentDomain>> stream() {
    return _external.box
        .query()
        .watch(triggerImmediately: true)
        .map((q) => ParentEntity.CONVERTER.toDomainAll(q.find()));
  }
}
