/*
   DEVELOPED BY: KAMLESH LAKHANI
   DEFINE THE TOTAL API OF APP
*/

import '../common/dio_helper.dart';

class NetworkProvider {
  final DioHelper _dioHelper;

  NetworkProvider(this._dioHelper);

  //POST API CALLING
  void postMethod(
      {Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(
        parameter: parameter,
        method: Method.POST,
        success: success,
        error: error);
  }

  //GET API CALLING
  void getMethod(
      {Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _dioHelper.request(
        parameter: parameter,
        method: Method.GET,
        success: success,
        error: error);
  }
}
