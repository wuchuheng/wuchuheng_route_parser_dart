<p align="center"><h1>wuchuheng_route_parser</h1></p>

## 2 What is wuchuheng_route_parser?

The wuchuheng_route_parser used to parse the information about route and to map route name to widget in flutter.

## 3 What is the features in  wuchuheng_route_parser?

* To parse the information about route in dart/flutter
* To get widget from map data that the route name map to widget.

## 4 How to use the library in dart or flutter?


Go to the root of  your flutter or dart project。 and then run the flowing command:

```bash
$ flutter pub add wuchuheng_route_parser
```
Or Install with dart

```bash
$ dart pub add wuchuheng_route_parser
```

## 5 How to use the library?

### 5.1 To map the widget with route name.
```dart
RoutesType routes = {
  '/': Text('/'),
  '/foods/:id/:name': Text('/foods/:id/:name'),
  '/foods/:id': Text('/foods/:id'),
};

// Then get the Text('/foods/:id');
Widget? resultWidget = parseRouteToWidget(routes, '/foods/1');
```

### 5.2 To parse the information with route name
```dart
final result = parseRouteInfo('/foods/:id/:name', '/foods/1/apple');
print(result); // {id: '1', name: 'apple'} 
```

## 6 Contributing

You can contribute in one of three ways:

1. File bug reports using the [issue tracker](https://github.com/wuchuheng/wuchuheng_route_parser_dart/issues).
2. Answer questions or fix bugs on the [issue tracker](https://github.com/wuchuheng/wuchuheng_route_parser_dart/issues).
3. Contribute new features or update the wiki.

## 7 License

MIT






