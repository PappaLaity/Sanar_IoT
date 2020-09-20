class User {
  int id ;
  String username;
  //String email;
  String password;
  //String gatewayId;

  User(this.username, this.password);

  User.map(dynamic obj) {
    this.username = obj['username'];
    this.password = obj['password'];
  }

  String get getUsername => username;
  String get getPassword => password;

  Map <String, dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map['username'] = this.username;
    map['password'] = this.password;
    return map;
  } 
}
