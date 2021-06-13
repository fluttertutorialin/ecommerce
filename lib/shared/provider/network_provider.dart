/*
   DEVELOPED BY: KAMLESH LAKHANI
   DEFINE THE TOTAL API OF APP
*/

import '../common/dio_helper.dart';

class NetworkProvider {
  final DioHelper _dioHelper;

  NetworkProvider(this._dioHelper);

  //POST API CALLING
  Future postMethod<T>(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback<T> success,
      required HttpFailureCallback error}) {
    return _dioHelper.request(
        baseUrl: baseUrl!,
        parameter: parameter,
        method: Method.POST,
        success: success,
        error: error);
  }

  //GET API CALLING
  Future getMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
   return _dioHelper.request(
        baseUrl: baseUrl!,
        parameter: parameter,
        method: Method.GET,
        success: success,
        error: error);
  }
}
