import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AuthenticationService.dart';
import 'package:iad_advertiser/core/view_models/BaseViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/User.dart';

class SignUpPageViewModel extends BaseViewModel{
  bool success = false;
  AuthenticationService _auth = locator<AuthenticationService>();

  Future<bool> signup(User user,String password) async{
    setState(ViewState.BUSY);
    success = await _auth.register(user, password);
    setState(ViewState.IDLE);
    return success;
  }
}