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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(todo.title),
                  Checkbox(
                    activeColor: Colors.orange,
                    value: todo.completed,
                    onChanged: (_) {
                      context.read<TodosController>().toggle(todo);
                    },
                  )
                ],
              ),
              padding: EdgeInsets.all(10.0),
            ),
          );
        });
  }
}
