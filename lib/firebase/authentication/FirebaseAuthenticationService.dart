import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AuthenticationService.dart';
import 'package:iad_advertiser/firebase/FirebaseAdvertisingPlatform.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService extends AuthenticationService {
  FirebaseAuth _auth;
  StreamController<User> currentAuthorizedUserStreamController = StreamController<User>.broadcast();

  FirebaseAuthenticationService() {
    _auth = FirebaseAuth.instance;
  }

  @override
  Future<User> login(String email, String password) async {
    User currentUser;
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
    print(user.uid);
    currentUser = User(user.email, user.uid);
    currentAuthorizedUserStreamController.add(currentUser);
    return currentUser;
  }

  @override
  Future<bool> register(User user,String password) async{
    User currentUser;
    FirebaseUser authorizedUser = (await _auth.createUserWithEmailAndPassword(email: user.email, password: password)).user;
    Firestore.instance.collection("Users").add(user.toJsonFormat());
    currentUser = User(authorizedUser.email, authorizedUser.uid);
    currentAuthorizedUserStreamController.add(currentUser);
    return authorizedUser.uid!=null && authorizedUser.uid.isNotEmpty;
  }

  @override
  Stream getCurrentAuthorizedUserStream() {
    return currentAuthorizedUserStreamController.stream;
  }
}
