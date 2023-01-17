class RoutingFormatErrorException implements Exception {
  late String _message;
  RoutingFormatErrorException(
      [String message = 'Routing format error exception']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}
