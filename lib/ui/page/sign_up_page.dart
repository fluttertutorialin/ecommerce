/*
   DEVELOPED BY: KAMLESH LAKHANI

   autofillHints: const [AutofillHints.password],
   autovalidateMode: AutovalidateMode.onUserInteraction

    autofillHints: const [AutofillHints.email],
    autovalidateMode: AutovalidateMode.onUserInteraction,
*/

import 'package:ecommerce/controller/controller_package.dart'
    show SignUpController;
import 'package:ecommerce/ui/widget/custom_text_field_widget.dart';
import 'package:ecommerce/ui/widget/stagger_animation.dart';
import '../../import_package.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Form(
                      key: controller.formKey,
                      child: Column(children: [
                        SizedBox(height: 90.h),
                        //USERNAME, EMAIL, PASSWORD, MOBILE TEXTFIELD
                        CustomTextFieldWidget(
                            controller: controller.userNameController,
                            validator: controller.userNameValidation,
                            maxLength: ValueString.userNameLength,
                            labelText: ValueString.userNameFormLabel),
                        SizedBox(height: 15.h),
                        CustomTextFieldWidget(
                            controller: controller.emailController,
                            validator: controller.emailValidation,
                            maxLength: ValueString.emailLength,
                            labelText: ValueString.emailFormLabel),
                        SizedBox(height: 15.h),
                        CustomTextFieldWidget(
                            controller: controller.passwordController,
                            obscureText: true,
                            suffixIcon: IconFont.passwordSecure,
                            validator: controller.passwordValidation,
                            maxLength: ValueString.passwordLength,
                            labelText: ValueString.passwordFormLabel),
                        SizedBox(height: 15.h),
                        CustomTextFieldWidget(
                            controller: controller.mobileController,
                            keyboardType: TextInputType.number,
                            validator: controller.mobileValidation,
                            maxLength: ValueString.mobileLength,
                            labelText: ValueString.mobileFormLabel),
                        SizedBox(height: 20.h),

                        //SIGNUP ANIMATION BUTTON
                        StaggerAnimation(
                            key: const Key('signUpSubmitButton'),
                            titleButton: ValueString.signUpButton,
                            buttonController: controller.singUpButtonController,
                            onTap: () {
                              controller.signUpValidateCheck((loading) {
                                if (loading) {
                                  controller.singUpButtonController.forward();
                                } else {
                                  controller.singUpButtonController.reverse();
                                }
                              });
                            })
                      ]))))));
}
