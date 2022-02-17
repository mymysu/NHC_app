import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    final List<Map<String, dynamic>> _items = List.generate(
        100,
        (index) => {
              "id": index,
              "title": "Item $index",
              "subtitle": "Subtitle $index"
            });
    return Scaffold(
        appBar: AppBar(
          title: Text('ข่าวสสน.'),
        ),
        body: ListTileTheme(
          contentPadding: EdgeInsets.all(15),
          iconColor: Colors.red,
          textColor: Colors.black54,
          tileColor: Colors.yellow[100],
          style: ListTileStyle.list,
          dense: true,
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (_, index) => Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(_items[index]['title']),
                subtitle: Text(_items[index]['subtitle']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
