// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../model/stock/stock.dart' as _i6;
import '../model/variable/variable.dart' as _i7;
import '../screens/details_screen.dart' as _i2;
import '../screens/home_screen.dart' as _i1;
import '../screens/variable_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CriteriaRoute.name: (routeData) {
      final args = routeData.argsAs<CriteriaRouteArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.CriteriaScreen(
          key: args.key,
          stock: args.stock,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    VariableRoute.name: (routeData) {
      final args = routeData.argsAs<VariableRouteArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.VariableScreen(
          key: args.key,
          variable: args.variable,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          CriteriaRoute.name,
          path: '/criteria-screen',
        ),
        _i4.RouteConfig(
          VariableRoute.name,
          path: '/variable-screen',
        ),
        _i4.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CriteriaScreen]
class CriteriaRoute extends _i4.PageRouteInfo<CriteriaRouteArgs> {
  CriteriaRoute({
    _i5.Key? key,
    required _i6.Stock stock,
  }) : super(
          CriteriaRoute.name,
          path: '/criteria-screen',
          args: CriteriaRouteArgs(
            key: key,
            stock: stock,
          ),
        );

  static const String name = 'CriteriaRoute';
}

class CriteriaRouteArgs {
  const CriteriaRouteArgs({
    this.key,
    required this.stock,
  });

  final _i5.Key? key;

  final _i6.Stock stock;

  @override
  String toString() {
    return 'CriteriaRouteArgs{key: $key, stock: $stock}';
  }
}

/// generated route for
/// [_i3.VariableScreen]
class VariableRoute extends _i4.PageRouteInfo<VariableRouteArgs> {
  VariableRoute({
    _i5.Key? key,
    required _i7.Variable variable,
  }) : super(
          VariableRoute.name,
          path: '/variable-screen',
          args: VariableRouteArgs(
            key: key,
            variable: variable,
          ),
        );

  static const String name = 'VariableRoute';
}

class VariableRouteArgs {
  const VariableRouteArgs({
    this.key,
    required this.variable,
  });

  final _i5.Key? key;

  final _i7.Variable variable;

  @override
  String toString() {
    return 'VariableRouteArgs{key: $key, variable: $variable}';
  }
}
