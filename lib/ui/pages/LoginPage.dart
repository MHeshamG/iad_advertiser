import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/Locator.dart';
import 'package:iad_advertiser/core/AuthenticationService.dart';
import 'package:iad_advertiser/core/view_models/LoginViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';
import 'package:iad_advertiser/ui/widgets/TextInputWidget.dart';
import 'package:iad_advertiser/validators/UserCredentialsValidator.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (BuildContext context, LoginViewModel viewModel, Widget child) =>
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        AppColors.light_purple,
                        AppColors.darkPurple
                      ])),
                ),
                Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          height: 500.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 32.0, bottom: 4.0),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: AppColors.appThemeColor,
                                      fontSize: 24.0),
                                ),
                              ),
                              Container(
                                height: 1,
                                width: 100,
                                color: AppColors.appThemeColor,
                                child: Divider(),
                              ),
                              buildLoginForm(context,viewModel),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.SIGNUP);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Don't have an Account? Sign up",
                                      style: TextStyle(
                                          color: AppColors.appThemeColor),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  "Or Sign up with",
                                  style: TextStyle(color: AppColors.pink),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Container(
                                  height: 1,
                                  width: 40,
                                  color: AppColors.pink,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    buildSignupOptionIcon(
                                        FontAwesomeIcons.facebook,
                                        Colors.blue[800]),
                                    buildSignupOptionIcon(
                                        FontAwesomeIcons.google,
                                        Colors.red[600]),
                                    buildSignupOptionIcon(
                                        FontAwesomeIcons.twitter,
                                        Colors.lightBlue),
                                  ],
                                ),
                              ),
                              viewModel.state == ViewState.BUSY?
                                  CircularProgressIndicator(backgroundColor: AppColors.appThemeColor,):Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Padding buildSignupOptionIcon(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(icon, color: color, size: 35),
    );
  }

  Widget buildLoginForm(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextInputWidget(
              _emailController,
              "Email",
              Icons.email,
              (emailString) =>
                  UserCredentialsValidator.isNotValidEmailFormat(emailString),
              false),
          TextInputWidget(
              _passwordController,
              "Password",
              Icons.lock,
              (passwordString) =>
                  UserCredentialsValidator.isNotValidPasswordFormat(
                      passwordString),
              true),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: RaisedButton(
              onPressed: () async{
                if (_formKey.currentState.validate()) {
                  User currentUser = await viewModel.login(_emailController.text, _passwordController.text);
                  if(currentUser!=null)
                    Navigator.pushNamed(context, Routes.HOME);
                }
              },
              color: AppColors.appThemeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Container(
                width: 120,
                height: 40,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
