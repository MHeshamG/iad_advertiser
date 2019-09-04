import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AuthenticationService.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/User.dart';

class LoginViewModel extends BaseViewModel{

  AuthenticationService _authenticationService;
  User user;

  LoginViewModel(){
    _authenticationService = locator<AuthenticationService>();
  }

  Future<User> login(String email, String password) async{
    setState(ViewState.BUSY);
    user = await _authenticationService.login(email, password);
    setState(ViewState.IDLE);
    return user;
  }


}