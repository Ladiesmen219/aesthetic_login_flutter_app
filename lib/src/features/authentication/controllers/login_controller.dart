import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/text_strings.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../utils/helper/helper_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  /// [EmailAndPasswordLogin]
  Future<void> login() async {
    try {
      isLoading.value = true;
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  /// [GoogleSignInAuthentication]
  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      isGoogleLoading.value = false;
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  /// [FacebookSignInAuthentication]
  Future<void> facebookSignIn() async {
    try {
      isFacebookLoading.value = true;
      await AuthenticationRepository.instance.signInWithFacebook();
      isFacebookLoading.value = false;
    } catch (e) {
      isFacebookLoading.value = false;
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }
}
