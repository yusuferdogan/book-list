// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../models/books.dart' as _i6;
import '../views/details_page.dart' as _i2;
import '../views/home_page.dart' as _i1;
import '../views/read_list_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    DetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsPageRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailsPage(book: args.book, key: args.key));
    },
    ReadListPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ReadListPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(HomeScreenRoute.name, path: '/'),
        _i4.RouteConfig(DetailsPageRoute.name, path: '/details-page'),
        _i4.RouteConfig(ReadListPageRoute.name, path: '/read-list-page')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.DetailsPage]
class DetailsPageRoute extends _i4.PageRouteInfo<DetailsPageRouteArgs> {
  DetailsPageRoute({required _i6.Book book, _i5.Key? key})
      : super(DetailsPageRoute.name,
            path: '/details-page',
            args: DetailsPageRouteArgs(book: book, key: key));

  static const String name = 'DetailsPageRoute';
}

class DetailsPageRouteArgs {
  const DetailsPageRouteArgs({required this.book, this.key});

  final _i6.Book book;

  final _i5.Key? key;

  @override
  String toString() {
    return 'DetailsPageRouteArgs{book: $book, key: $key}';
  }
}

/// generated route for
/// [_i3.ReadListPage]
class ReadListPageRoute extends _i4.PageRouteInfo<void> {
  const ReadListPageRoute()
      : super(ReadListPageRoute.name, path: '/read-list-page');

  static const String name = 'ReadListPageRoute';
}
