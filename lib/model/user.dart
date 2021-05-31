final String userTable = 'user';

class UserFields {
  static final List<String> values = [username, password, userid, usertype];
  static final String username = 'username';
  static final String password = 'password';
  static final String userid = 'userid';
  static final String usertype = 'usertype';
}

class User {
  String username;
  String password;
  int userId;
  String userType;
  User({this.password, this.userId, this.userType, this.username});
  User copy({int userid, String username, String password, String usertype}) =>
      User(
          password: password ?? this.password,
          userId: userid ?? this.userId,
          userType: usertype ?? this.userType,
          username: username ?? this.username);

  static User fromJson(Map<String, Object> json) => User(
      password: json[UserFields.password] as String,
      userId: json[UserFields.userid] as int,
      userType: json[UserFields.usertype] as String,
      username: json[UserFields.username] as String);

  Map<String, Object> toJson() => {
        UserFields.userid: userId,
        UserFields.password: password,
        UserFields.username: username,
        UserFields.usertype: userType
      };
}
