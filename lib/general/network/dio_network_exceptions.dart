import 'dart:io';

import 'package:dio/dio.dart';

/// Network exception For DIO package

class NetworkExceptionsManager {
  // todo what about SocketException?
  NetworkExceptionsManager._internal();

  factory NetworkExceptionsManager() => NetworkExceptionsManager._internal();

  NetworkException transformToNetworkException(DioError dioError) {
    NetworkException networkException;
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        networkException = ConnectionTimeoutException();
        break;
      case DioErrorType.sendTimeout:
        networkException = SendTimeoutException();
        break;
      case DioErrorType.receiveTimeout:
        networkException = ReceiveTimeoutException();
        break;
      case DioErrorType.response:
        Response? errorResponse = dioError.response;
        networkException = _handleError(
            dioError.response?.statusCode ?? -1,
            (errorResponse != null)
                ? "${errorResponse.data}\n${errorResponse.headers}\n${errorResponse.requestOptions}"
                : "${dioError.requestOptions}\n${dioError.message}");
        break;
      case DioErrorType.cancel:
        networkException = CancelRequestException();
        break;
      case DioErrorType.other:
        if (dioError.error is SocketException) {
          networkException = NoInternetConnectionException();
        } else if (dioError.error is FormatException) {
          networkException = InvalidFormatException();
        } else {
          networkException = OtherNetworkException();
        }
        break;
    }
    return networkException;
  }

  // you can add specific cases if this is required
  NetworkException _handleError(int statusCode, String errorMessage) {
    if (statusCode >= 400 && statusCode < 500) {
      return ApiException(statusCode);
    } else if (statusCode >= 500) {
      return ServerException(statusCode);
    } else {
      return NotAppSupportedStatusCodeException(statusCode);
    }
  }
}

abstract class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => message;
}

class ConnectionTimeoutException implements NetworkException {
  ConnectionTimeoutException._internal();

  factory ConnectionTimeoutException() => ConnectionTimeoutException._internal();

  @override
  String get message => "Connection timeout";
}

class SendTimeoutException implements NetworkException {
  SendTimeoutException._internal();

  factory SendTimeoutException() => SendTimeoutException._internal();

  @override
  String get message => "Send timeout";
}

class ReceiveTimeoutException implements NetworkException {
  ReceiveTimeoutException._internal();

  factory ReceiveTimeoutException() => ReceiveTimeoutException._internal();

  @override
  String get message => "Receive timeout";
}

class CancelRequestException implements NetworkException {
  CancelRequestException._internal();

  factory CancelRequestException() => CancelRequestException._internal();

  @override
  String get message => "Cancel request";
}

class OtherNetworkException implements NetworkException {
  OtherNetworkException._internal();

  factory OtherNetworkException() => OtherNetworkException._internal();

  @override
  String get message => "Other network issue";
}

// inferred from status code exceptions START
class ApiException implements NetworkException {
  final int statusCode;

  const ApiException(this.statusCode);

  @override
  String get message =>
      'Error occured while Communication from the App with StatusCode: $statusCode';
}

class ServerException implements NetworkException {
  final int statusCode;

  const ServerException(this.statusCode);

  @override
  String get message =>
      'Error occured while Communication with Server with StatusCode: $statusCode';
}

class NotAppSupportedStatusCodeException implements NetworkException {
  final int statusCode;

  const NotAppSupportedStatusCodeException(this.statusCode);

  @override
  String get message => 'Not supported status code $statusCode';
}
// inferred from status code exceptions END

class NoInternetConnectionException implements NetworkException {
  const NoInternetConnectionException();

  @override
  String get message => 'No Internet Connection';
}

class InvalidFormatException implements NetworkException {
  const InvalidFormatException();

  @override
  String get message => 'Invalid format';
}