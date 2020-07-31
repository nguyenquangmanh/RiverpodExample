import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _counterProvider = StateProvider((ref) => 0);
class Counter extends HookWidget {

  const Counter({Key key}) : super(key: key);

  static const routeName = '/counter';
  static const pageName = 'Counter';

  @override
  Widget build(BuildContext context) {

    final increment = useProvider(_counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text('${useProvider(_counterProvider).state}',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increment.state++,
        child: const Icon(Icons.add),
      ),
    );

  }

}
