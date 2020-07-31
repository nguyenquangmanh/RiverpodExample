import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/page/counter_page.dart';
import 'package:riverpod_example/page/multiple_counter.dart';

import 'home_page.dart';

@immutable
class PageInfo {

  final String pageName;
  final String routeName;
  PageInfo({this.pageName, @required this.routeName});

  static List<PageInfo> get all => [
    PageInfo(pageName: Counter.pageName, routeName: Counter.routeName),
    PageInfo(pageName: MultipleCounter.pageName, routeName: MultipleCounter.routeName),
  ];

}

final routerProvider = Provider((_) => _Router());

class _Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    Home.routeName: (_) => const Home(),
    Counter.routeName: (_) => const Counter(),
    MultipleCounter.routeName: (_) => const MultipleCounter(),
  };

  Route onGenerateRoute(RouteSettings settings) {
    final pushPage = pushRoutes[settings.name];
    return MaterialPageRoute<void>(
      settings: settings,
      builder: pushPage,
    );
  }
}