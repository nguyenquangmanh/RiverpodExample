import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/page/home_page.dart';
import 'package:riverpod_example/page/route.dart';
import 'package:riverpod_example/providers/theme.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      themeMode: useProvider(ThemeModeController.provider.state),
      darkTheme: ThemeData.dark(),
      onGenerateRoute: useProvider(routerProvider).onGenerateRoute,
      home: Home(),
    );
  }

}
