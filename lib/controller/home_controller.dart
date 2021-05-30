/*
   DEVELOPED BY: KAMLESH LAKHANI

*/

import 'package:ecommerce/import_package.dart';
import '../shared/repository/network_repository.dart';

class HomeController extends GetxController {
  late NetworkRepository _networkRepository;

  HomeController(this._networkRepository);

  @override
  void onInit() {
    super.onInit();

    _postResponseApi();
  }

  //API CALL
  _postResponseApi() {
    print(Strings.postUrl);
    _networkRepository.getMethod(
        baseUrl: Strings.postUrl, success: (value) {}, error: (error) {});
  }
}
