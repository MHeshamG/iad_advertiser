import 'package:iad_advertiser/model/User.dart';

abstract class AuthenticationService{
  Future<User> login(String email, String password);
  Future<bool> register(User user);
}