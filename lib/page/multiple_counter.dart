
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/providers/multiple_counter.dart';

class MultipleCounter extends HookWidget {

  const MultipleCounter({Key key}) : super(key: key);

  static const routeName = '/multipleCounter';
  static const pageName = 'MultipleCounter';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('MultipleCounter'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
       body: ListView.separated(
           itemBuilder: (context,index) => _Tile(index: index,),
           separatorBuilder: (context, _) => const Divider(height: 2),
           itemCount: 100),
    );
  }
}

class _Tile extends HookWidget {
  const _Tile({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final t = useProvider(counterProviderFamily(index));
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text('${useProvider(counterProviderFamily(index).state)}'),
          trailing: IconButton(
            onPressed: () => t.increment(),
            icon: Icon(Icons.add),
          ),
        ),
      ),
    );

  }

}