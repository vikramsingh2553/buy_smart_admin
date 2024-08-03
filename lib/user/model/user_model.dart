class UserModel {
  final String id;
  final String usernamae;

  UserModel({required this.id, required this.usernamae, });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      usernamae: json['username'],
    );
  }
}
