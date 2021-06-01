/*
   DEVELOPED BY: KAMLESH LAKHANI

   autofillHints: const [AutofillHints.password],
   autovalidateMode: AutovalidateMode.onUserInteraction

    autofillHints: const [AutofillHints.email],
    autovalidateMode: AutovalidateMode.onUserInteraction,
*/

import 'package:ecommerce/controller/controller_package.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../import_package.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
          child: InkWell(
              onTap: () => controller.loginGoogle(success: (User? user) {
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
                      color: Colors.white, size: 24.0)))));
}
