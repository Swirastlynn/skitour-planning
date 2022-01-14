/// For http package
class NotSupportedStatusCodeException implements Exception {
  final int statusCode;

  const NotSupportedStatusCodeException(this.statusCode);

  @override
  String toString() => 'Not supported status code $statusCode';
}

class ApiException implements Exception {
  final int statusCode;

  const ApiException(this.statusCode);

  @override
  String toString() =>
      'Error occured while Communication from the App with StatusCode: $statusCode';
}

class ServerException implements Exception {
  final int statusCode;

  const ServerException(this.statusCode);

  @override
  String toString() =>
      'Error occured while Communication with Server with StatusCode: $statusCode';
}

class NoInternetConnectionException implements Exception {
  const NoInternetConnectionException();

  @override
  String toString() => 'No Internet Connection';
}
