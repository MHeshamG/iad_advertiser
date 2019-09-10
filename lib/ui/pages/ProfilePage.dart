import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iad_advertiser/model/User.dart';
import 'package:iad_advertiser/ui/ui_utils/AppColors.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  Image backgroundImage;

  ProfilePage() {
    backgroundImage = Image.network(
        "https://mymodernmet.com/wp/wp-content/uploads/2018/03/xavier-portela-new-york-glow-7.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        backgroundImage,
        Container(
          height: MediaQuery.of(context).size.height * 0.357,
          color: AppColors.appThemeColor.withOpacity(0.8),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            centerTitle: true,
            title: Text(
              "Profile",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(top: 40.0),
            height: 450,
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.white.withOpacity(0.95),
                    elevation: 8.0,
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: <Widget>[
                            buildNameWidget(
                              Provider.of<User>(context).name,
                            ),
                            buildAddressWidget(
                              Provider.of<User>(context).address,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                buildUserInfoWidget(Icons.email,
                                    Provider.of<User>(context).email),
                                buildUserInfoWidget(Icons.phone_android,
                                    Provider.of<User>(context).phone)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                buildProfilePicWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Align buildProfilePicWidget() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.appThemeColor),
        width: 80,
        height: 80,
        child: Icon(
          FontAwesomeIcons.solidUserCircle,
          size: 70.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Text buildAddressWidget(String address) {
    return Text(
      address,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
    );
  }

  Text buildNameWidget(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
    );
  }

  Widget buildUserInfoWidget(IconData icon, String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: AppColors.appThemeColor,
            ),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
