/*
   DEVELOPED BY: KAMLESH LAKHANI

   autofillHints: const [AutofillHints.password],
   autovalidateMode: AutovalidateMode.onUserInteraction

    autofillHints: const [AutofillHints.email],
    autovalidateMode: AutovalidateMode.onUserInteraction,
*/

import 'package:ecommerce/controller/controller_package.dart' show LoginController;
import 'package:ecommerce/ui/widget/custom_text_field_widget.dart';
import 'package:ecommerce/ui/widget/stagger_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../import_package.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  ModalRoute? _mountRoute;

  @override
  void didChangeDependencies() {
    _mountRoute = ModalRoute.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    LoginController.to.formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = _mountRoute == ModalRoute.of(context)
        ? LoginController.to.formKey
        : Key('hack-to-dispose-of-will-pop-callback');
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Form(
                        key: formKey,
                        child: Column(children: [
                          SizedBox(height: 90.h),
                          SizedBox(height: 90.h),

                          //EMAIL AND PASSWORD
                          CustomTextFieldWidget(
                              controller: LoginController.to.emailController,
                              validator: LoginController.to.emailValidation,
                              maxLength: ValueString.emailLength,
                              labelText: ValueString.emailFormLabel),
                          SizedBox(height: 15.h),
                          CustomTextFieldWidget(
                              controller: LoginController.to.passwordController,
                              obscureText: true,
                              suffixIcon: IconFont.passwordSecure,
                              validator: LoginController.to.passwordValidation,
                              maxLength: ValueString.passwordLength,
                              labelText: ValueString.passwordFormLabel),
                          SizedBox(height: 20.h),

                          //LOGIN ANIMATION BUTTON
                          StaggerAnimation(
                              key: const Key('loginSubmitButton'),
                              titleButton: ValueString.loginButton,
                              buttonController: LoginController.to
                                  .loginButtonController,
                              onTap: () {
                                LoginController.to.loginValidateCheck((
                                    loading) {
                                  if (loading) {
                                    LoginController.to.loginButtonController
                                        .forward();
                                  } else {
                                    LoginController.to.loginButtonController
                                        .reverse();
                                  }
                                });
                              }),
                          SizedBox(height: 40.h),

                          //SOCIAL LOGIN (GOOGLE, FACEBOOK)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    borderRadius: BorderRadius.circular(25.0),
                                    onTap: () =>
                                        LoginController.to.loginGoogle(
                                            success: (User? user) {
                                              print(user!.displayName);
                                            }, fail: (error) {
                                          print(error);
                                        }),
                                    child: CircleAvatar(
                                        backgroundColor:
                                        AppColors.googleRed.withOpacity(0.2),
                                        child: IconFont.google)),
                                SizedBox(width: 20.h),
                                InkWell(
                                    borderRadius: BorderRadius.circular(25.0),
                                    onTap: () =>
                                        LoginController.to.loginGoogle(
                                            success: (User? user) {},
                                            fail: (error) {
                                              print(error);
                                            }),
                                    child: CircleAvatar(
                                        backgroundColor: AppColors.facebookBlue
                                            .withOpacity(0.2),
                                        child: IconFont.facebook))
                              ]),
                          SizedBox(height: 40.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(ValueString.doNotHaveAccount,
                                    style: AppTextStyle.doNotHaveAccountStyle),
                                GestureDetector(
                                    onTap: () =>
                                        LoginController.to.signUpNavigation(),
                                    child: Text(' ${ValueString.signUp}',
                                        style: AppTextStyle.signUpStyle))
                              ])
                        ]))))));
  }
}
