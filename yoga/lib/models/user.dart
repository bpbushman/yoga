class User {
  final String username;
  final String email;
  final String uid;

  User({
    this.username,
    this.email,
    this.uid
  });

  User.fromData(Map<String, dynamic> data) :
    uid = data['uid'],
    email = data['email'],
    username = data['username'];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email
    };
  }
  
}