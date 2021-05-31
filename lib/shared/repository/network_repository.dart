/*
   DEVELOPED BY: KAMLESH LAKHANI
   ABSTRACT CLASS (NetworkProvider) API IMPLEMENT
*/

import 'package:get/get.dart';
import '../common/dio_helper.dart';
import '../provider/network_provider.dart';

class NetworkRepository implements NetworkProvider {
  final _networkProvider = Get.find<NetworkProvider>();

  //GET API CALLING
  @override
  void getMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _networkProvider.getMethod(
        baseUrl: baseUrl!,
        parameter: parameter,
        success: success,
        error: error);
  }

  //POST API CALLING
  @override
  void postMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter,
      required HttpSuccessCallback success,
      required HttpFailureCallback error}) {
    _networkProvider.postMethod(
        baseUrl: baseUrl!,
        parameter: parameter!,
        success: success,
        error: error);
  }
}
