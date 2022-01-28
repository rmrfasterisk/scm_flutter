class UserModel {
  late String name;
  late String email;
  late String role;
  late String uid;

  UserModel(this.name, this.email, this.uid);

  UserModel.fromMap(Map<String, dynamic> mapData) {
    uid = mapData["user_id"];
    name = mapData["name"];
    email = mapData["email"];
    role = mapData["role"];
  }
}
