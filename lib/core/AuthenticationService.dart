import 'package:iad_advertiser/model/User.dart';

abstract class AuthenticationService{
  bool login(User user);
  bool register(User user);
}