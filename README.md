# clean_repo_objectbox

`clean_repo_objectbox` pretende ser un framework para facilitar y abstraer el uso de la BD ObjectBox en aplicaciones con Clean Arquitecture

## Table of Contents
  - [Table of Contents](#table-of-contents)
  - [Ejemplo de uso](#Ejemplo-de-uso)
    - [Entidad](#Entidad)
    - [Definición](#Definición)
    - [Implementación](#Implementación)
    - [Init](#Init)

## Ejemplo de uso
A continuación el código de como usarlo para hacer un CRUD repo que interactúe con ObjectBox y se integre con facilidad a Clean.


### [Entidad](https://github.com/JesusHdezWaterloo/clean_repo_objectbox/blob/master/example/lib/repo/entities/Entities.dart)
```dart
@Entity() 
class ParentEntity extends BasicEntityObject<ParentDomain> {
  static final ParentConverter CONVERTER = ParentConverter();//see example for details

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
```

### [Definición](https://github.com/JesusHdezWaterloo/clean_repo_objectbox/blob/master/example/lib/repo/repo_external/ParentRepoExternal.dart)
```dart
import 'package:clean_repo_objectbox/CleanObjectBoxExporter.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';

abstract class ParentRepoExternal extends ObjectBoxCRUDRepositoryExternal<ParentEntity> {
}
```

### [Implementación](https://github.com/JesusHdezWaterloo/clean_repo_objectbox/blob/master/example/lib/repo/repo_external_impl/ParentRepoExternalImpl.dart)
```dart
import 'package:clean_repo_objectbox/CleanObjectBoxExporter.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';
import 'package:objectbox/objectbox.dart';

class ParentRepoExternalImpl
    extends DefaultObjectBoxCRUDRepositoryExternal<ParentEntity>
    implements ParentRepoExternal {
  ParentRepoExternalImpl(Store store) : super(store);
}

```

### [Init]()
```dart
Store store = await openStore().then((value) {
  ParentRepo PARENT_REPO = ParentRepoImpl(ParentRepoExternalImpl(value));
  return value;
});
```