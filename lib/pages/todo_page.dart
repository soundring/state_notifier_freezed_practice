import 'package:flutter/material.dart';
import '../widgets/todo_list.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Todoリスト'),
      ),
      backgroundColor: Colors.grey,
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.pushNamed(context, '/add_todo_page');
        },
      ),
    );
  }
}
