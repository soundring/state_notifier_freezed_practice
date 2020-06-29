import 'package:flutter/material.dart';
import '../state/counter_state.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.select<CounterState, String>((s) => s.count.toString()),
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              padding: EdgeInsets.all(20.0),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pushNamed(context, '/todo_page');
              },
              child: Text('Todoへ'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterController>().increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
