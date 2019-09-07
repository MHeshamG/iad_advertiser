class User {
  String email;
  String address;
  String phone;
  String id;

  User(this.email, this.id);
  User.createUserWithWholeData(this.email,this.phone,this.address);

  Map<String, dynamic> toJsonFormat() {
    return{
      "email":email,
      "phone":phone,
      "address":address
    };
  }
}
