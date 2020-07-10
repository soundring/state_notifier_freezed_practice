import 'package:flutter_test/flutter_test.dart';
import 'package:statenotifierfreezedapp/model/todo.dart';

void main() {
  test('Todo test', () {
    const todo = Todo(id: '1', title: 'テスト', completed: false);
    expect(todo.id, '1');
    expect(todo.title, 'テスト');
    expect(todo.completed, false);
  });
}
