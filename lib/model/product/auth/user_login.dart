// ignore_for_file: public_member_api_docs, sort_constructors_first

// user login,signup and delete

class UserLogin {
  final String username;
  final String password;

  UserLogin({required this.username, required this.password});

  // to json
  Map<String, dynamic> toMap() {
    return <String, dynamic>{'username': username, 'password': password};
  }

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}
