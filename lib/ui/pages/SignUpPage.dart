import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/core/view_models/SignUpPageViewModel.dart';
import 'package:iad_advertiser/core/view_models/ViewState.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:iad_advertiser/navigation/Routes.dart';
import 'package:iad_advertiser/ui/BaseView.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';
import 'package:iad_advertiser/ui/widgets/TextInputWidget.dart';
import 'package:iad_advertiser/validators/UserCredentialsValidator.dart';
class SignUpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>SignUpPageState();

}
class SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  static final _signUpformKey = GlobalKey<FormState>();
  bool isSignUpButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder:
          (BuildContext context, SignUpPageViewModel viewModel, Widget child) =>
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                          height: 580.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 32.0, bottom: 4.0),
                                child: Text(
                                  "SIGNUP",
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
                              buildSignupForm(context, viewModel),
                              viewModel.state == ViewState.BUSY ?
                              CircularProgressIndicator() : Container()
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

  Widget buildSignupForm(BuildContext context, SignUpPageViewModel viewModel) {
    return Form(
      key: _signUpformKey,
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
          TextInputWidget(
              _phoneController,
              "Phone",
              Icons.phone_android,
                  (phoneString) =>
                  UserCredentialsValidator.isNotValidPhoneFormat(phoneString),
              false),
          TextInputWidget(
              _addressController,
              "Address",
              Icons.location_city,
                  (addressString) =>
                  UserCredentialsValidator.isNotValidAddressFormat(
                      addressString),
              false),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: RaisedButton(
              onPressed: () async {
                if (_signUpformKey.currentState.validate()) {
                  isSignUpButtonPressed = true;
                  User newUser = User.createUserWithWholeData(
                      _emailController.text,
                      _phoneController.text,
                      _addressController.text);
                  bool success = await viewModel.signup(newUser, _passwordController.text);
                  if(success)
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
                    "Sign up",
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
