import 'package:iad_advertiser/core/AuthenticationService.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService extends AuthenticationService {
  FirebaseAuth _auth;

  FirebaseAuthenticationService() {
    _auth = FirebaseAuth.instance;
  }

  @override
  Future<User> login(String email, String password) async {
    User currentUser;
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    currentUser = User(user.email, user.uid);
    return currentUser;
  }

  @override
  Future<bool> register(User user) {
    // TODO: implement register
    return null;
  }
}
