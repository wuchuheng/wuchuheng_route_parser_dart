import 'package:flutter/material.dart';

import 'exceptions/routing_format_error_exception.dart';

typedef RoutesType = Map<String, Widget Function()>;

/// Get Widget with routeName
Widget? Function() parseRouteToWidget(RoutesType routes, String routeName) {
  for (var nameInRoute in routes.keys) {
    final RegExp regExp = RegExp(r"\/:([A-z]\w+)");
    final matchResult = regExp.allMatches(nameInRoute);
    if (matchResult.isEmpty) {
      continue;
    }

    Map<String, String> routeParameterMapRouteName = {};
    String routeReg = nameInRoute.replaceAll('/', '\\/');
    for (int i = 0; i < matchResult.length; i++) {
      var match = matchResult.elementAt(i);
      String key = match.group(0)!;
      if (routeParameterMapRouteName.containsKey(key)) {
        throw RoutingFormatErrorException(
          "The parameter name error in the route name: $routeName",
        );
      }
      routeReg = routeReg.replaceFirst(
        '\\/${key.substring(1)}',
        '\\/([^\\/]+)',
      );
    }
    bool isOk = RegExp(routeReg).hasMatch(routeName);
    if (isOk) {
      return routes[nameInRoute]!;
    }
  }

  return () {
    return null;
  };
}

typedef RouteInfoType = Map<String, String>;

/// Exampel  parseRouteInfo("/foods/:id/:name", 'foods/1/apple');
RouteInfoType parseRouteInfo(String routeName, String route) {
  final RegExp regExp = RegExp(r"/:([A-z]\w+)");
  final matchResult = regExp.allMatches(routeName);
  RouteInfoType result = {};
  if (matchResult.isEmpty) {
    return result;
  }
  Map<String, String> routeParameterMapRouteName = {};
  String routeReXp = routeName.replaceAll('/', '\\/');
  List<String> routeParams = [];
  for (int i = 0; i < matchResult.length; i++) {
    var match = matchResult.elementAt(i);
    String key = match.group(0)!;
    String value = match.group(1)!;
    if (routeParameterMapRouteName.containsKey(key)) {
      throw RoutingFormatErrorException(
        "The parameter name error in the route name: $routeName",
      );
    }
    routeReXp =
        routeReXp.replaceFirst('\\/${key.substring(1)}', '\\/([^\\/]+)');
    routeParams.add(key);
  }
  final routeMatchResult = RegExp(routeReXp).allMatches(route);
  if (routeMatchResult.isEmpty) {
    return result;
  }
  for (int i = 0; i < routeMatchResult.length; i++) {
    var match = routeMatchResult.elementAt(i);
    for (int indexOfMatchGroup = 1;
        indexOfMatchGroup <= match.groupCount;
        indexOfMatchGroup++) {
      String value = match.group(indexOfMatchGroup)!;
      String key = routeParams[indexOfMatchGroup - 1];
      result[key.substring(2)] = value;
    }
  }

  return result;
}
