import 'package:clean_core/clean_core.dart';
import 'package:objectbox/objectbox.dart';

@Entity() //flutter pub run build_runner build
class KeyValueEntity extends BasicEntityObject {
  @Id()
  int id;

  @Unique(onConflict: ConflictStrategy.replace)
  String key;

  String value;

  KeyValueEntity(this.key, this.value,
      {this.id = 0}); //default construct, DON'T REMOVE

}
