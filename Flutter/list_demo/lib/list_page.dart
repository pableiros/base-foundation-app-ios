import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<String> _list = List.generate(
    100,
    (index) => 'Row $index',
  );

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter List'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _list[index],
              style: const TextStyle(fontSize: 17.0),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.grey[300]);
        },
        itemCount: _list.length,
      ),
    );
  }
}
