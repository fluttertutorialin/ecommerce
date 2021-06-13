/*
   DEVELOPED BY: KAMLESH LAKHANI
   ABSTRACT CLASS (NetworkProvider) API IMPLEMENT
*/

import 'package:dartz/dartz.dart';

import '../common/dio_helper.dart';
import '../provider/network_provider.dart';

class NetworkRepository implements NetworkProvider {
  final DioHelper _dioHelper;

  NetworkRepository(this._dioHelper);

  //GET API CALLING
  @override
  Future<Either<ErrorEntity, dynamic>> getMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter}) {

    return _dioHelper.request(baseUrl: baseUrl, method: Method.GET, parameter: parameter);
  }

  //POST API CALLING
  @override
  Future<Either<ErrorEntity, dynamic>> postMethod(
      {String? baseUrl,
      Map<String, dynamic>? parameter}) {
    return _dioHelper.request(baseUrl: baseUrl, method: Method.POST, parameter: parameter);
  }
}
