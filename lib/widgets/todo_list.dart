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
          return SafeArea(
            child: Card(
              child: Padding(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(flex: 2, child: Text(todo.title)),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          '更新',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit_todo_page',
                              arguments: {'id': todo.id, 'title': todo.title});
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          '削除',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Todo target = todo;
                          context.read<TodosController>().delete(target);
                        },
                      ),
                    ),
                    Expanded(
                      child: Checkbox(
                        activeColor: Colors.orange,
                        value: todo.completed,
                        onChanged: (_) {
                          context.read<TodosController>().toggle(todo);
                        },
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.all(10.0),
              ),
            ),
          );
        });
  }
}
