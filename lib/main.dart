import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'pages/add_todo_page.dart';
import 'pages/counter_page.dart';
import 'pages/edit_todo_page.dart';
import 'pages/todo_page.dart';
import 'state/counter_state.dart';

import 'state/todo_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<CounterController, CounterState>(
          create: (_) => CounterController(),
        ),
        StateNotifierProvider<TodosController, TodosState>(
          create: (_) => TodosController(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => CounterPage(),
          '/todo_page': (context) => TodoPage(),
          '/add_todo_page': (context) => AddTodoPage(),
          '/edit_todo_page': (context) => EditTodoPage(),
        },
      ),
    );
  }
}
