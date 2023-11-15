import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';

import '../../common/global_loader/global_loader.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo(msg: 'Your name is empty');
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo(msg: 'Your name is too short');
      return;
    }
    if (state.email.isEmpty || email.isEmpty) {
      toastInfo(msg: 'Your email is empty');
      return;
    }
    if (state.password.isEmpty ||
        state.rePassword.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo(msg: 'your password is empty');
      return;
    }

    if (password != rePassword || state.password != state.rePassword) {
      toastInfo(msg: 'your password did not match');
      return;
    }

    //show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      log(credential as String);

      final user = credential.user;
      if (user != null) {
        await user.sendEmailVerification();
        await user.updateDisplayName(name);
        //get server photo url
        //set user photo url
        toastInfo(
          msg: "Asn email has been sent to verify your account. "
              "Please open that email and confirm your identify",
        );
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'This password is too week');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'This email has already been registered');
      }
    } catch (e) {
      log("catch==${e.toString()}");
    }
    //show the register page
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
