/*
   DEVELOPED BY: KAMLESH LAKHANI
   API CALLING CLASS
*/

import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum Method { GET, POST, DELETE, PUT }

const MethodValues = {
  Method.GET: 'get',
  Method.POST: 'post',
  Method.DELETE: 'delete',
  Method.PUT: 'put'
};

typedef HttpSuccessCallback<T> = void Function(T data);
typedef HttpFailureCallback = void Function(ErrorEntity data);
final CancelToken _cancelToken = new CancelToken();

_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class DioHelper {
  Future request<T>({
    String? baseUrl = '',
    Method? method = Method.GET,
    String? path,
    String contentType = Headers.jsonContentType,
    dynamic data,
    Map<String, dynamic>? parameter,
    RequestOptions? requestOptions,
    required HttpSuccessCallback<T>? success,
    required HttpFailureCallback? error,
  }) async {
    try {
      final baseOptions = BaseOptions(
          baseUrl: baseUrl!,
          contentType: contentType,
          responseType: ResponseType.bytes,
          receiveDataWhenStatusError: false,
          connectTimeout: 60000,
          receiveTimeout: 3000,
          headers: {});

      final dio = Dio(baseOptions);

      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
      };

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;

      var response = await dio.request(path!, data: data,
          onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + '%');
        }
      },
          queryParameters: parameter,
          options: Options(method: MethodValues[method!]),
          cancelToken: _cancelToken);

      if (success != null) {
        success(response.data);
      }

      return response.data;
    } on DioError catch (e) {
      error!(_getError(e));
    }
  }

  // REQUEST CANCEL
  cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  _getError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return ErrorEntity(code: -1, message: 'dioRequestCancellation'.tr);
        }
      case DioErrorType.connectTimeout:
        {
          return ErrorEntity(code: -1, message: 'dioConnectionTimeOut'.tr);
        }
      case DioErrorType.sendTimeout:
        {
          return ErrorEntity(code: -1, message: 'dioRequestTimeOut'.tr);
        }
      case DioErrorType.receiveTimeout:
        {
          return ErrorEntity(code: -1, message: 'dioResponseTimeout'.tr);
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response!.statusCode;
            switch (errCode) {
              case 400:
                return ErrorEntity(
                    code: errCode, message: 'dioRequestSyntaxError'.tr);

              case 403:
                return ErrorEntity(
                    code: errCode, message: 'dioServerRefusedToExecute'.tr);

              case 404:
                return ErrorEntity(
                    code: errCode, message: 'dioNotConnectServer'.tr);

              case 405:
                return ErrorEntity(
                    code: errCode, message: 'dioRequestForbidden'.tr);

              case 500:
                return ErrorEntity(
                    code: errCode, message: 'dioServerInternalError'.tr);

              case 502:
                return ErrorEntity(
                    code: errCode, message: 'dioInvalidRequest'.tr);

              case 503:
                return ErrorEntity(code: errCode, message: 'dioServerDown'.tr);

              case 505:
                return ErrorEntity(
                    code: errCode, message: 'dioHttpNotSupport'.tr);
              default:
                return ErrorEntity(
                    code: errCode, message: 'dioUnknownMistake'.tr);
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: 'dioUnknownError'.tr);
          }
        }

      default:
        return ErrorEntity(code: -1, message: error.message);
    }
  }
}

//GET THE ERROR FROM API
class ErrorEntity {
  final int? code;
  final String? message;

  ErrorEntity({this.code, this.message});
}
