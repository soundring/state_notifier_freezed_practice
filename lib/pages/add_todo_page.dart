import 'package:flutter/material.dart';
import '../widgets/add_tofo.dart';

class AddTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('追加'),
      ),
      body: AddTodo(),
    );
  }
}
