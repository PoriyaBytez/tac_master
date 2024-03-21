class UserModel {
  final String? id;
  final String? username;
  final String? email;
  final String? password;

  UserModel({
     this.id,
     this.username,
     this.email,
     this.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      username: data['username'],
      email: data['email'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
