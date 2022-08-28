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
import 'package:mi_finity/screens/dice.dart' as _i2;
import 'package:mi_finity/screens/history.dart' as _i3;
import 'package:mi_finity/screens/home.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    Dice.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.Dice());
    },
    History.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.History());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(Home.name, path: '/'),
        _i4.RouteConfig(Dice.name, path: '/Dice'),
        _i4.RouteConfig(History.name, path: '/History')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i4.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.Dice]
class Dice extends _i4.PageRouteInfo<void> {
  const Dice() : super(Dice.name, path: '/Dice');

  static const String name = 'Dice';
}

/// generated route for
/// [_i3.History]
class History extends _i4.PageRouteInfo<void> {
  const History() : super(History.name, path: '/History');

  static const String name = 'History';
}
