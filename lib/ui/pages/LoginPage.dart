import 'package:flutter/material.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    colors: [AppColors.light_purple, AppColors.darkPurple])),
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
                    height: 450.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 32.0, bottom: 4.0),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: AppColors.appThemeColor, fontSize: 24.0),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: 100,
                          color: AppColors.appThemeColor,
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email),focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.appThemeColor,
                                    width: 2))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.appThemeColor,
                                        width: 2))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: RaisedButton(
                            onPressed: () {},
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              print("sign up");
                            },
                            child: Text(
                              "Don't have an Account? Sign up",
                              style: TextStyle(color: AppColors.appThemeColor),
                            ))
                      ],
                    ),
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
