/*
   DEVELOPED BY: KAMLESH LAKHANI
*/

import 'package:ecommerce/import_package.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController
    with SingleGetTickerProviderMixin {
  final GetStorageRepository _getStorageRepository;
  final FirebaseRepository _firebaseRepository;

  late User? user;

  //VALIDATION USE
  final formKey = GlobalKey<FormState>();

  //TEXT CLEAR AND GET
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  // PROGRESSBAR
  /*final _statusProgressBarRx = Rx<StatusProgressBar>(StatusProgressBar.INITIAL); // SET DATA
    get statusProgressBar => _statusProgressBarRx.value; //GET DATA
  */

  late AnimationController singUpButtonController;

  //CONSTRUCTOR
  SignUpController(this._getStorageRepository, this._firebaseRepository);

  //PAGE LAUNCH FIRST SCROLL
  @override
  void onInit() {
    super.onInit();
    singUpButtonController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
  }

  // SIGNUP VALIDATION CHECK THE FORM
  Future<void> signUpValidateCheck(Function loading) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      loading(true);

      //HOME SCREEN NAVIGATION
      AppRoute.HOME.changeScreen();
    }
  }

  //VALIDATION
  String? emailValidation(String? value) => Validator.validateEmail(value);

  String? passwordValidation(String? value) =>
      Validator.validatePassword(value);

  String? userNameValidation(String? value) =>
      Validator.validateUserName(value);

  String? mobileValidation(String? value) => Validator.validateMobile(value);

  //CLEAR RESOURCE
  @override
  void onClose() {
    super.onClose();
    singUpButtonController.dispose();

    emailController.dispose();
    passwordController.dispose();
  }
}
