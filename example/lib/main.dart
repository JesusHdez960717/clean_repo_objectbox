import 'package:clean_repo_objectbox_example/objectbox_example_exporter.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  final faker = Faker();

  void _addNote(String text) {
    if (text.isEmpty) return;
    ObjectBoxExampleCoreModule.PARENT_USECASE.create(ParentDomain(
        name: text,
        bornDay: faker.date.dateTime(minYear: 1980, maxYear: 2000)));
    _noteInputController.text = '';
  }

  Future initialize() async {
    await ObjectBoxExampleCoreModule.init();
  }

  @override
  void dispose() {
    _noteInputController.dispose();
    ObjectBoxExampleCoreModule.PARENT_USECASE.streamController().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              key: Key('submit'),
              onPressed: () => _addNote(faker.person.name()),
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
          onPressed: () => _addNote(_noteInputController.text),
          child: Icon(Icons.add),
        ),
      );

  _buildBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: TextField(
            decoration: InputDecoration(hintText: 'Enter a new note'),
            controller: _noteInputController,
            onSubmitted: (value) => _addNote(_noteInputController.text),
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
          stream: ObjectBoxExampleCoreModule.PARENT_USECASE
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
              ObjectBoxExampleCoreModule.PARENT_USECASE.destroy(notes[index]),
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
                            'Added on ${DateFormat.yMMMd().format(notes[index].bornDay)}',
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
