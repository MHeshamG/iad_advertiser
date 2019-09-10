class User {
  String email;
  String name;
  String address;
  String phone;
  String id;

  User(this.email, this.id);
  User.createUserWithWholeData(this.email,this.name,this.phone,this.address);

  Map<String, dynamic> toJsonFormat() {
    return{
      "email":email,
      "name":name,
      "phone":phone,
      "address":address
    };
  }
}
