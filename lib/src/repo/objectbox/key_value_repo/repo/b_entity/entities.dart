import 'package:clean_core/clean_core.dart';
import 'package:objectbox/objectbox.dart';

@Entity() // flutter pub run build_runner build
class ParentEntity extends BasicEntityObject {
  @Id()
  int id;

  String key;

  String value;

  ParentEntity(this.key, this.value,
      {this.id = 0}); //default construct, DON'T REMOVE

}
