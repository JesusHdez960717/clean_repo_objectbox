import 'package:clean_core/clean_core.dart';
import 'package:clean_repo_objectbox_example/app/objectbox_app_exporter.dart';
import 'package:objectbox/objectbox.dart';

@Entity() // flutter pub run build_runner build
class ParentEntity extends BasicEntityObject<ParentDomain> {
  static final ParentConverter CONVERTER = ParentConverter();

  @Id()
  int id;

  String name;

  @Property(type: PropertyType.date)
  DateTime bornDay;

  ///todo: docs => no se puede estandarizar, es una buena práctica
  ParentEntity.fromDomain(ParentDomain domain)
      : id = domain.id,
        name = domain.name,
        bornDay = domain.bornDay;

  //@Backlink()
  //final childs = ToMany<ChildEntity>();

  ParentEntity(this.name, this.bornDay,
      {this.id = 0}); //default construct, DON'T REMOVE

  //this is the one to use
  ParentEntity.build({required this.name, this.id = 0, DateTime? date})
      : bornDay = date ?? DateTime.now();

  @override
  ParentDomain toDomain() {
    return ParentDomain(id: id, name: name, bornDay: bornDay);
  }
}

class ParentConverter
    extends DefaultGeneralConverter<ParentDomain, ParentEntity> {
  @override
  ParentDomain toDomain(ParentEntity entity) {
    return entity.toDomain();
  }

  @override
  ParentEntity toEntity(ParentDomain domain) {
    return ParentEntity.fromDomain(domain);
  }
}

@Entity() //flutter pub run build_runner build
class ChildEntity extends BasicEntityObject<ChildDomain> {
  static final ChildConverter CONVERTER = ChildConverter();

  @Id()
  int id;

  String name;

  final ToOne<ParentEntity> parentFK = ToOne<ParentEntity>();

  //default construct, DON'T REMOVE
  ChildEntity(this.name, {this.id = 0});

  ChildEntity.fromDomain(ChildDomain domain)
      : id = domain.id,
        name = domain.name {
    parentFK.target = ParentEntity.CONVERTER.toEntity(domain
        .parentFK); //todo: docs => hasta que no se genere el .g da error de casteo
  }

  //this is the one to use
  ChildEntity.build(this.name, ParentEntity parent, {this.id = 0}) {
    parentFK.target = parent;
  }

  @override
  ChildDomain toDomain() {
    return ChildDomain(
        id: id, name: name, parentFK: parentFK.target!.toDomain());
  }
}

class ChildConverter extends DefaultGeneralConverter<ChildDomain, ChildEntity> {
  @override
  ChildDomain toDomain(ChildEntity entity) {
    return entity.toDomain();
  }

  @override
  ChildEntity toEntity(ChildDomain domain) {
    return ChildEntity.fromDomain(domain);
  }
}
