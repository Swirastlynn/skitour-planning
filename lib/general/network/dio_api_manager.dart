import 'dart:async';

import 'package:dio/dio.dart';
import 'package:skitour_planning/main.dart';

import 'custom_exceptions.dart';

const _defaultConnectTimeout = 5000;
const _defaultReceiveTimeout = 3000;

// todo better ApiManager like in https://dev.to/ashishrawat2911/handling-network-calls-and-exceptions-in-flutter-54me
class DioApiManager {
  // todo extract abstract class and implement it atop http manager and dio manager
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: _defaultConnectTimeout,
      receiveTimeout: _defaultReceiveTimeout,
    ),
  );

  Future<dynamic> getAPICall(String url) async {
    logger.d("Calling API: $url");

    try {
      Response response = await _dio.get(url);
      return _validateResponse(response);
    } on DioError catch (dioError) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      Response? errorResponse = dioError.response;
      if (errorResponse != null) {
        logger.e(errorResponse.data);
        logger.e(errorResponse.headers);
        logger.e(errorResponse.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        logger.e(dioError.requestOptions);
        logger.e(dioError.message);
      }
    }
  }

  dynamic _validateResponse(Response<dynamic> response) {
    int statusCode = response
        .statusCode!; // todo null for DioErrorType.CANCEL, DioErrorType.CONNECT_TIMEOUT, DEFAULT, RECEIVE_TIMEOUT, SEND_TIMEOUT. int for DioErrorType.RESPONSE, SocketException
    if (statusCode >= 300 && statusCode < 400 && statusCode != 304) {
      throw NotSupportedStatusCodeException(statusCode);
    } else if (statusCode >= 400 && statusCode < 500) {
      throw ApiException(statusCode);
    } else if (statusCode >= 500) {
      throw ServerException(statusCode);
    }
    return response.data;
  }
}
