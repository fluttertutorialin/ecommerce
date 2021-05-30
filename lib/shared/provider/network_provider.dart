/*
   DEVELOPED BY: KAMLESH LAKHANI
   ABSTRACT CLASS DEFINE THE TOTAL API OF APP
*/

import '../common/dio_helper.dart';

abstract class NetworkProvider {
  late DioHelper _dioHelper;

  NetworkProvider(this._dioHelper);

  void postMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(
        baseUrl: baseUrl,
        parameter: parameter,
        method: Method.POST,
        success: success,
        error: error);
  }

  void getMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(
        baseUrl: baseUrl,
        parameter: parameter,
        method: Method.GET,
        success: success,
        error: error);
  }
}
