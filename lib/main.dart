import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ReorderableListView Example'),
        ),
        body: ReorderableListView(
          children: items
              .map((item) => ListTile(
                    key: Key(item),
                    title: Text(item),
                  ))
              .toList(),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}
