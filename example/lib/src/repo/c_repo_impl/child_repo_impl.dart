import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ChildRepoImpl extends DefaultCRUDRepo<ChildDomain, ChildEntity>
    implements ChildRepo {
  ChildRepoImpl()
      : super(
            externalRepo: ChildRepoExternalImpl(),
            converter: ChildConverter.converter);
}

class ChildConverter extends DefaultGeneralConverter<ChildDomain, ChildEntity> {
  static final ChildConverter converter = ChildConverter._();

  ChildConverter._();

  @override
  ChildDomain toDomain(ChildEntity entity) {
    return ChildDomain(
        name: entity.name,
        parentFK: ParentConverter.converter.toDomain(
          entity.parentFK.target!,
        ),
        id: entity.id);
  }

  @override
  ChildEntity toEntity(ChildDomain domain) {
    return ChildEntity.build(
        domain.name,
        ParentConverter.converter.toEntity(
          domain.parentFK,
        ),
        id: domain.id);
  }
}
