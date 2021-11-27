import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skitour_planning/general/logger.dart';

import 'custom_exceptions.dart';

/// Manage API calls for simple http library.
/// More sophisticated http library should support error handling with its own exceptions.
class ApiManager {
  Future<dynamic> getAPICall(Uri url) async {
    logger.d("Calling API: $url");

    var jsonResponse;
    try {
      final httpResponse = await http.get(url);
      jsonResponse = _validateResponse(httpResponse);
    } on SocketException {
      throw NoInternetConnectionException();
    }
    return jsonResponse;
  }

  dynamic _validateResponse(http.Response response) {
    var statusCode = response.statusCode;
    if (statusCode >= 200 && statusCode < 300) {
      final decodedJson = utf8.decode(response.bodyBytes);
      logger.d("API Response: $decodedJson");
      return json.decode(decodedJson);
    } else if (statusCode >= 300 && statusCode < 400) {
      throw NotSupportedStatusCodeException(statusCode);
    } else if (statusCode >= 400 && statusCode < 500) {
      throw ApiException(statusCode);
    } else if (statusCode >= 500) {
      throw ServerException(statusCode);
    }
  }
}
