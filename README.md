# clean_repo_objectbox

`clean_repo_objectbox` pretende ser un framework para facilitar y abstraer el uso de la BD ObjectBox en aplicaciones con Clean Arquitecture

## Table of Contents
  - [Table of Contents](#table-of-contents)
  - [Ejemplo de uso](#Ejemplo-de-uso)
    - [Definición](#Definición)
    - [Implementación](#Implementación)
    - [Init](#Init)

## Ejemplo de uso
A continuación el código de como usarlo para hacer un CRUD repo que interactúe con ObjectBox y se integre con facilidad a Clean.

### [Definición]()
```dart
import 'package:clean_repo_objectbox/CleanObjectBoxExporter.dart';
import 'package:clean_repo_objectbox_example/repo/objectbox_repo_exporter.dart';

abstract class ParentRepoExternal extends ObjectBoxCRUDRepositoryExternal<ParentEntity> {
}
```

### [Implementación]()
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