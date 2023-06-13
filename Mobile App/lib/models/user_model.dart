class UserModel {
  String uid;
  String email;
  String name;
  String address;
  String mobile;
  String img;

  UserModel(
      this.uid, this.email, this.name, this.address, this.mobile, this.img);

  //-------this named constructor will bind json data to our model
  UserModel.fromJason(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'],
        address = json['address'],
        mobile = json['phone'],
        img = json['img'];
}
