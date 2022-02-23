import 'package:clean_repo_objectbox/clean_objectbox_exporter.dart';
import 'package:clean_repo_objectbox_example/src_single_key_value/bool_key_value_usecase_impl.dart';
import 'package:flutter/material.dart';

import 'bool_key_value_usecase.dart';

void main() =>
    runApp(MyApp()); //flutter run -t lib/src_single_key_value/main.dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'ObjectBox Key Value Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'ObjectBox Key Value  Example'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BoolKeyValueUseCase uc;

  Future initialize() async {
    await KeyValueCoreModule.init();
    uc = BoolKeyValueUseCaseImpl();
  }

  _changeValue() {
    setState(() {
      uc.changeValue();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: initialize(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(
                  uc.read().toString(),
                ),
              );
            }
          },
        ),
        // We need a separate submit button because flutter_driver integration
        // test doesn't support submitting a TextField using "enter" key.
        // See https://github.com/flutter/flutter/issues/9383
        floatingActionButton: FloatingActionButton(
          key: Key('submit'),
          onPressed: () => _changeValue(),
          child: Icon(Icons.add),
        ),
      );
}
