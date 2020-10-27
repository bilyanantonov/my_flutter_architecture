class User {
  final String userId;
  String userName;
  String email;

  User({this.userId, this.userName, this.email});

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'userName': userName, 'email': email};
  }

  User.fromMap(Map<String, dynamic> map)
      : userId = map['userId'],
        userName = map['userName'],
        email = map['email'];

        
}
