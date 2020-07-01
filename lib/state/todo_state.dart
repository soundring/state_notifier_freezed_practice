import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:uuid/uuid.dart';
import '../model/todo.dart';
import 'package:flutter/foundation.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodosState with _$TodosState {
  const factory TodosState({
    @Default(<Todo>[]) List<Todo> todos,
  }) = TodosStateData;
}

class TodosController extends StateNotifier<TodosState> with LocatorMixin {
  TodosController() : super(const TodosState());

  final _uuid = Uuid();

  void initState() async {
    super.initState();

    //初期データ
    state = TodosState(todos: [
      Todo(id: _uuid.v4(), title: 'Providerを学習する'),
      Todo(id: _uuid.v4(), title: 'StateNotifierを学習する'),
      Todo(id: _uuid.v4(), title: 'freezedを学習する'),
    ]);
  }

  void add(String title) {
    final currentState = state;
    if (currentState is TodosStateData) {
      final todos = currentState.todos.toList()
        ..add(Todo(id: _uuid.v4(), title: title));
      state = currentState.copyWith(
        todos: todos,
      );
    }
  }

  void toggle(Todo todo) {
    final currentState = state;
    if (currentState is TodosStateData) {
      final todos = currentState.todos.map((t) {
        if (t == todo) {
          return t.copyWith(
            completed: !t.completed,
          );
        }
        return t;
      }).toList();
      state = TodosState(
        todos: todos,
      );
    }
  }

  void edit({@required String id, @required String title}) {
    final currentState = state;
    if (currentState is TodosStateData) {
      final todos = currentState.todos.map((t) {
        if (t.id == id) {
          return t.copyWith(
            title: title,
          );
        }
        return t;
      }).toList();
      state = TodosState(todos: todos);
    }
  }

  void delete(Todo target) {
    final currentState = state;
    final todos = currentState.todos
        .where((currentTodo) => currentTodo.id != target.id)
        .toList();
    state = TodosState(todos: todos);
  }
}
