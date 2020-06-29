import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statenotifierfreezedapp/state/todo_state.dart';
import '../model/todo.dart';
import '../state/todo_state.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todos =
        context.select<TodosState, List<Todo>>((state) => state.todos);
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, int index) {
          final todo = todos[index];
          return Card(
            child: Padding(
              child: Text(todo.title),
              padding: EdgeInsets.all(20.0),
            ),
          );
        });
  }
}
