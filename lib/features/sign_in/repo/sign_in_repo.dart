import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
 static Future<UserCredential> firebaseSignIn(
      {required String email, required String password}) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}
