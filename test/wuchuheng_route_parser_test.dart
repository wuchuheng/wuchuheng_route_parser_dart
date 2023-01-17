import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:wuchuheng_route_parser/wuchuheng_route_parser.dart';

void main() {
  RoutesType routes = {
    '/': () => Text('/'),
    '/foods/:id/:name': () => Text('/foods/:id/:name'),
    '/foods/:id': () => Text('/foods/:id'),
  };

  test('Get Widget by route', () async {
    Widget? Function() resultWidget = parseRouteToWidget(routes, '/foods/1');
    expect(resultWidget(), isNotNull);
    expect((resultWidget() as Text).data, '/foods/:id');
  });

  test('Parse information with routeName', () async {
    final result1 = parseRouteInfo('/foods/:id', '/foods/1');
    expect(result1['id'], '1');
    final result2 = parseRouteInfo('/foods/:id/:name', '/foods/1/apple');
    expect(result2['id'], '1');
    expect(result2['name'], 'apple');
  });
}
