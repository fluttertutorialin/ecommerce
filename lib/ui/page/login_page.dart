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
import '../../import_package.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.whiteCardBackground,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Form(
                      key: controller.formKey,
                      child: Column(children: [
                        SizedBox(height: 90.h),
                        SizedBox(height: 90.h),

                        //EMAIL AND PASSWORD
                        CustomTextFieldWidget(
                            validator: controller.emailValidation,
                            maxLength: ValueString.emailLength,
                            labelText: ValueString.emailTextLabel),
                        SizedBox(height: 10.h),
                        CustomTextFieldWidget(
                            validator: controller.validatePassword,
                            maxLength: ValueString.passwordLength,
                            labelText: ValueString.passwordLabel),
                        SizedBox(height: 20.h),

                        //LOGIN ANIMATION BUTTON
                        StaggerAnimation(
                            key: const Key('loginSubmitButton'),
                            titleButton: ValueString.loginButton,
                            buttonController: controller.loginButtonController,
                            onTap: () {
                              controller.loginValidateCheck((loading) {
                                if (loading) {
                                  controller.loginButtonController.forward();
                                } else {
                                  controller.loginButtonController.reverse();
                                }
                              });
                            }),
                        SizedBox(height: 40.h),

                        //SOCIAL LOGIN (GOOGLE, FACEBOOK)
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () => controller.loginGoogle(
                                          success: (User? user) {
                                        print(user!.displayName);
                                      }, fail: (error) {
                                        print(error);
                                      }),
                                  child: CircleAvatar(
                                      backgroundColor: AppColors.googleRed.withOpacity(0.2),
                                      child: IconFont.google)),
                              SizedBox(width: 20.h),
                              InkWell(
                                  onTap: () => controller.loginGoogle(
                                      success: (User? user) {},
                                      fail: (error) {
                                        print(error);
                                      }),
                                  child: CircleAvatar(
                                      backgroundColor: AppColors.facebookBlue.withOpacity(0.2),
                                      child: IconFont.facebook))
                            ])
                      ]))))));
}
