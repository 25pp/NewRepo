// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GridSearchScreen(),
    );
  }
}

class GridSearchScreen extends StatefulWidget {
  const GridSearchScreen({super.key});

  @override
  _GridSearchScreenState createState() => _GridSearchScreenState();
}

class _GridSearchScreenState extends State<GridSearchScreen> {
  List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Grapes',
    'Lemon',
    'Orange',
    'Peach',
    'Pear',
    'Strawberry',
    'Mango',
    'Chickoo',
    'Plum',
    'Pomegranate',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _filterItems,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.green,
                      child: Center(
                        child: Text(filteredItems[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
