import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/features/sign_in/repo/sign_in_repo.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/main.dart';

import '../../../common/models/user.dart';
import '../../../common/widgets/popup_messages.dart';
import '../provider/sign_in_notifier.dart';

class SignInController {
  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn({required WidgetRef ref}) async {
    var state = ref.read(signInNotifierProvider);

    String email = state.email;
    String password = state.password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo(msg: 'Your email is empty');
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo(msg: 'your password is empty');
      return;
    }

    ///show loader
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential =
          await SignInRepo.firebaseSignIn(email: email, password: password);

      if (credential.user == null) {
        toastInfo(msg: 'User not found');
      }
      // if (!credential.user!.emailVerified) {
      //   toastInfo(msg: 'You must verify your email address first !');
      // }
      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.email = email;
        loginRequestEntity.name = displayName;
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;

        asyncPostAllData(loginRequestEntity);
        log("User logged In");
      } else {
        toastInfo(msg: 'Login error !');
      }
    } on FirebaseAuthException catch (e) {
      ///this errors do not get me by FirebaseAuth
      if (e.code == 'user-not-found') {
        toastInfo(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        toastInfo(msg: 'Wrong password provided for that user.');
      }else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        toastInfo(msg: 'Parol yoki login xato');
      }if (e.code == 'invalid-email') {
        toastInfo(msg: 'Email xato');
      }
      log("exception == ${e.code.toString()}");
    } catch (e) {
      log(e.toString());
    }

    ///hide loader
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    //we need to talk to server

    // have local storage
    try {
      //try to remember user info
      Global.storageService.setString(
        AppConstants.STORAGE_USER_PROFILE_KEY,
        jsonEncode({
          'name': "Davron",
          'email': 'davronbazarovnot8@gmail.com',
          'age': 25,
        }),
      );
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");

      navKey.currentState
          ?.pushNamedAndRemoveUntil('/application', (route) => false);
    } catch (e) {
      log(e.toString());
    }
    //redirect to new page
  }
}
