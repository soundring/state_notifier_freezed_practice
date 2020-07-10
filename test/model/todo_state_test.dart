import 'package:flutter_test/flutter_test.dart';
import 'package:statenotifierfreezedapp/state/todo_state.dart';

void main() {
  TodosController target;

  setUp(() {
    target = TodosController();
  });

  test('TodosController test', () {
    // ignore: invalid_use_of_protected_member
    expect(target.state.todos.length, 0);

    //初期化
    target.initState();

    expect(target.state.todos.length, 3);

    //Todoを追加
    target.add('テスト');

    expect(target.state.todos.length, 4);

    expect(target.state.todos[3].title.toString(), 'テスト');

    expect(target.state.todos[0].completed, false);

    //完了/未完了の切り替え
    target.toggle(target.state.todos[0]);

    expect(target.state.todos[0].completed, true);

    //Todoの編集
    target.edit(id: target.state.todos[3].id, title: 'テストオオオオオオオオオ');
    expect(target.state.todos[3].title.toString(), 'テストオオオオオオオオオ');

    //Todoの削除
    target.delete(target.state.todos[3]);
    expect(target.state.todos.length, 3);
  });
}
