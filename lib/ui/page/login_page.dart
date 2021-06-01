/*
   DEVELOPED BY: KAMLESH LAKHANI

   autofillHints: const [AutofillHints.password],
   autovalidateMode: AutovalidateMode.onUserInteraction

    autofillHints: const [AutofillHints.email],
    autovalidateMode: AutovalidateMode.onUserInteraction,
*/

import 'package:ecommerce/controller/controller_package.dart';
import 'package:ecommerce/ui/widget/custom_text_field_widget.dart';
import 'package:ecommerce/ui/widget/stagger_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../import_package.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Form(
                      key: controller.formKey,
                      child: Column(children: [
                        //EMAIL AND PASSWORD
                        CustomTextFieldWidget(
                            labelText: ValueString.emailTextLabel),
                        SizedBox(height: 5.h),
                        CustomTextFieldWidget(
                            labelText: ValueString.passwordLabel),
                        SizedBox(height: 20.h),
                        //LOGIN ANIMATION BUTTON
                        StaggerAnimation(
                            key: const Key('loginSubmitButton'),
                            titleButton: 'Login',
                            buttonController: controller.loginButtonController,
                            onTap: () {
                              controller.loginButtonController.forward();
                              controller.loginValidateCheck((loading) => loading
                                  ? controller.loginButtonController.forward()
                                  : controller.loginButtonController.reverse());
                            }),
                        SizedBox(height: 40.h),
                        //SOCIAL LOGIN (GOOGLE, FACEBOOK)
                        Center(
                            child: InkWell(
                                onTap: () => controller.loginGoogle(
                                        success: (User? user) {
                                      print(user!.displayName);
                                    }, fail: (error) {
                                      print(error);
                                    }),
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: const Color(0xFFEA4336),
                                    ),
                                    child: const Icon(FontAwesomeIcons.google,
                                        color: Colors.white, size: 24.0))))
                      ]))))));
}
