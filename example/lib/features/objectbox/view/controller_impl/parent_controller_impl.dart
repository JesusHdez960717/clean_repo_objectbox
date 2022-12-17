import 'dart:async';
import 'dart:math';

import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';

class ParentControllerImpl extends ParentController {
  final ParentUseCase parentUC;

  ParentControllerImpl({required this.parentUC});

  @override
  void addParent(String name) {
    if (name.isEmpty) return;
    parentUC.create(
      ParentDomain(
        name: name,
        bornDay: DateTime.fromMicrosecondsSinceEpoch(
          Random().nextInt(
            1000000000000000,
          ),
        ),
      ),
    );
  }

  @override
  StreamController<List<ParentDomain>> streamController() {
    return parentUC.streamController();
  }

  @override
  void delete(ParentDomain parent) {
    parentUC.delete(parent);
  }
}
