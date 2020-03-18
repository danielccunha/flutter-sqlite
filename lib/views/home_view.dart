import 'package:flutter/material.dart';
import 'package:flutter_sqlite/models/dog.dart';
import 'package:flutter_sqlite/repositories/dog_repository.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final repository = DogRepository();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter with Database')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: const Text('Test'),
              onPressed: () {
                final dog = Dog(id: ++count, age: 1, name: 'Dog $count');
                repository.insert(dog);
              },
            ),
            const SizedBox(height: 8.0),
            RaisedButton(
              child: const Text('Log'),
              onPressed: () => repository.log(),
            ),
          ],
        ),
      ),
    );
  }
}
