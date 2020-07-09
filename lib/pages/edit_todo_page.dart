import 'package:flutter/material.dart';
import '../widgets/edit_todo.dart';

class EditTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('編集'),
      ),
      body: EditTodo(),
    );
  }
}
