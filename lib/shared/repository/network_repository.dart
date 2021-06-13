/*
   DEVELOPED BY: KAMLESH LAKHANI
   ABSTRACT CLASS (NetworkProvider) API IMPLEMENT
*/

import '../common/dio_helper.dart';
import '../provider/network_provider.dart';
import 'package:get/get.dart';

class NetworkRepository implements NetworkProvider {
  final _networkProvider = Get.find<NetworkProvider>();

  //GET API CALLING
  @override
  Future getMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    return _networkProvider.getMethod(
        baseUrl: baseUrl!,
        parameter: parameter,
        success: success,
        error: error);
  }

  //POST API CALLING
  @override
  Future postMethod<T>(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback<T> success,
      required HttpFailureCallback error}) {
    return _networkProvider.postMethod(
        baseUrl: baseUrl!,
        parameter: parameter,
        success: success,
        error: error);
  }
}
