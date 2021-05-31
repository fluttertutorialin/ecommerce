/*
   DEVELOPED BY: KAMLESH LAKHANI
   DIO LOG DISPLAY
*/

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class DefaultLogInterceptor extends Interceptor {
  DefaultLogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = false,
    this.responseHeader = true,
    this.responseBody = false,
    this.error = true,
    this.logSize = 2048,
  });

  /// Print request [Options]
  late bool request;

  /// Print request header [Options.headers]
  late bool requestHeader;

  /// Print request data [Options.data]
  late bool requestBody;

  /// Print [Response.data]
  late bool responseBody;

  /// Print [Response.headers]
  late bool responseHeader;

  /// Print error message
  late bool error;

  /// Log size per print
  late final logSize;

  late DateTime startTime;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    startTime = DateTime.now();
    logFinest('Request Start');
    logFinest('Uri: ${options.uri}');
    if (request) {
      logFinest('Method: ${options.method}');
      logFinest('ContentType: ${options.contentType}');
      logFinest('ResponseType: ${options.responseType}');
      logFinest('FollowRedirects: ${options.followRedirects}');
      logFinest('ConnectTimeout: ${options.connectTimeout}');
      logFinest('ReceiveTimeout: ${options.receiveTimeout}');
      logFinest('Extra: ${options.extra}');
    }
    if (requestHeader) {
      logFinest('Header: ${options.headers}');
    }
    if (requestBody) {
      logFinest('Data: ${options.data ?? '{}'}');
    }

    logFinest('Request End');
    return options;
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    final now = DateTime.now();
    final duration = startTime == null ? null : now.difference(startTime);
    if (error) {
      logWarning('DioError Start');
      logWarning('${err.message}', err);
      if (err.response != null) {
        var response = err.response;
        if (responseHeader) {
          logWarning('StatusCode: ${response!.statusCode}');
          if (response.isRedirect ?? false) {
            logWarning('Redirect: ${response.realUri}');
          }
          logWarning('Headers: ${response.headers}');
        }
        if (responseBody) {
          logWarning('Data: ${response.toString()}');
        }
        logWarning('Time: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(now)}');
        if (duration != null) {
          logWarning('Duration: ${duration.inMilliseconds}ms');
        }
      }
      logWarning('DioError End');
    }
    return err;
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
    final now = DateTime.now();
    final duration = startTime == null ? null : now.difference(startTime);
    logFinest('Response Start');
    if (responseHeader) {
      logFinest('StatusCode: ${response.statusCode}');
      if (response.isRedirect == true) {
        logFinest('Redirect: ${response.realUri}');
      }
      logFinest('Headers: ${response.headers}');
    }
    if (responseBody) {
      logFinest('Data: $response');
    }

    if (duration != null) {
      logFinest('Duration: ${duration.inMilliseconds}ms');
    }
    logFinest('Response End');
    return response;
  }

  void logFinest(message) {
    //Log.finest(message, null, null, false);
  }

  void logWarning(message, [error]) {
    //Log.warning(message, error, null, false);
  }
}
