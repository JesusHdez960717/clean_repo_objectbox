import 'dart:math';

import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';
import 'package:flutter/material.dart';

//flutter pub run build_runner build
void main() => runApp(MyApp()); //flutter run -t lib/main.dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'ObjectBox Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'ObjectBox Example'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _noteInputController = TextEditingController();

  Future initialize() async {
    await FeatureObjectboxModule.init();
  }

  @override
  void dispose() {
    _noteInputController.dispose();
    FeatureObjectboxModule.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              key: Key('submit'),
              onPressed: () =>
                  FeatureObjectboxModule.PARENT_CONTROLLER.addParent(
                "Chicho el cojo ${Random().nextInt(50000)}",
              ),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: FutureBuilder(
          future: initialize(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return _buildBody();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          key: Key('submit'),
          onPressed: () {
            FeatureObjectboxModule.PARENT_CONTROLLER.addParent(
              _noteInputController.text,
            );
            _noteInputController.clear();
          },
          child: Icon(Icons.add),
        ),
      );

  _buildBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: TextField(
            decoration: InputDecoration(hintText: 'Enter a new parent'),
            controller: _noteInputController,
            onSubmitted: (value) {
              FeatureObjectboxModule.PARENT_CONTROLLER.addParent(
                _noteInputController.text,
              );
              _noteInputController.clear();
            },
            // Provide a Key for the integration test
            key: Key('input'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, right: 20.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Tap a note to remove it',
              style: TextStyle(
                fontSize: 11.0,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        StreamBuilder<List<ParentDomain>>(
          stream: FeatureObjectboxModule.PARENT_CONTROLLER
              .streamController()
              .stream,
          builder: (context, snapshot) => ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: snapshot.hasData ? snapshot.data!.length : 0,
            itemBuilder: _itemBuilder(snapshot.data ?? []),
          ),
        )
      ],
    );
  }

  GestureDetector Function(BuildContext, int) _itemBuilder(
      List<ParentDomain> notes) {
    return (BuildContext context, int index) => GestureDetector(
          onTap: () =>
              FeatureObjectboxModule.PARENT_CONTROLLER.delete(notes[index]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          notes[index].name,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          // Provide a Key for the integration test
                          key: Key('list_item_$index'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            'Added on ${notes[index].bornDay.toString()}',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
