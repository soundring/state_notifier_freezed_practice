import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statenotifierfreezedapp/state/todo_state.dart';
import '../state/todo_state.dart';

class EditTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final String id = arguments['id'];
    final String title = arguments['title'];

    TextEditingController _textEditingController;
    _textEditingController = new TextEditingController(text: title);

    String editTodoTitle;

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              'Todoを編集してください',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
          ),
          TextField(
            controller: _textEditingController,
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              editTodoTitle = value;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text(
              '編集',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0),
            ),
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () {
              if (editTodoTitle == null) {
                editTodoTitle = title;
              }
              context
                  .read<TodosController>()
                  .edit(id: id, title: editTodoTitle);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
