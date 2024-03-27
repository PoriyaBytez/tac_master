class UserModel {
  final String? id;
  final String? username;
  final String? email;

  UserModel({
     this.id,
     this.username,
     this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      username: data['username'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }
}
