import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statenotifierfreezedapp/state/todo_state.dart';
import '../state/todo_state.dart';

class EditTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    final id = arguments['id'].toString();
    final title = arguments['title'].toString();

    TextEditingController _textEditingController;
    _textEditingController = TextEditingController(text: title);

    String editTodoTitle;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              'Todoを編集してください',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
          const SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text(
              '編集',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            color: Colors.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              editTodoTitle ??= title;

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
