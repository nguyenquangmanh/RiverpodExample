import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:riverpod_example/page/route.dart';
import 'package:riverpod_example/providers/theme.dart';


class Home extends HookWidget {

  const Home({Key key}) : super(key: key);

  static const routeName = '/';
  static const pageName = 'Home';

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(ThemeModeController.provider);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
            IconButton(
              icon: Icon(MdiIcons.themeLightDark),
              onPressed: () => theme.toggle(),
            ),
        ],
      ),
      body: ListView(
        children: [
          ...PageInfo.all.map((info){
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(info.pageName),
                  trailing: const Icon(MdiIcons.pageNext),
                  onTap:() => Navigator.of(context).pushNamed(info.routeName),
                ),
                Divider(),
              ],
            );
          })
        ],
      ),
    );
  }

}