class UserCredentialsValidator {

  static bool isNotValidEmailFormat(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return true;
    else
      return false;
  }

  static bool isNotValidPasswordFormat(String password) {
    if (password.length<6)
      return true;
    else
      return false;
  }

  static isNotValidPhoneFormat(String phone) {
    if (phone.length<11)
      return true;
    else
      return false;
  }

  static isNotValidAddressFormat(String address) {
    if (address.length<15)
      return true;
    else
      return false;
  }

}
