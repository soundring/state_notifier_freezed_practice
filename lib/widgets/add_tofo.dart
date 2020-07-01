import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statenotifierfreezedapp/state/todo_state.dart';
import '../state/todo_state.dart';

class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTodoTitle;
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              'Todoを入力してください',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              newTodoTitle = value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text(
              '追加',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {
              if (newTodoTitle == null) {
                newTodoTitle = 'No Title';
              }
              context.read<TodosController>().add(newTodoTitle);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
