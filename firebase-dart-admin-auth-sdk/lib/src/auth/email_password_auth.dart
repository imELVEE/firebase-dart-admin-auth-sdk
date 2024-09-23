import 'package:firebase_dart_admin_auth_sdk/src/firebase_auth.dart';
import 'package:firebase_dart_admin_auth_sdk/src/user.dart';
import 'package:firebase_dart_admin_auth_sdk/src/user_credential.dart';

class EmailPasswordAuth {
  final FirebaseAuth auth;

  EmailPasswordAuth(this.auth);

  Future<UserCredential> signIn(String email, String password) async {
    final response = await auth.performRequest('signInWithPassword', {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });
    print(response);
    final userCredential = UserCredential.fromJson(response);
    auth.updateCurrentUser(userCredential.user);
    return userCredential;
  }

  Future<User> signUp(String email, String password) async {
    final response = await auth.performRequest('signUp', {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });

    final user = User.fromJson(response);
    auth.updateCurrentUser(user);
    return user;
  }
}
