class User {
  final int id;
  final int idUserType;
  final String userName;
  final String pass;
  final String userKind;
  final String userType;
  final String speciality;

  User({
    required this.id,
    required this.idUserType,
    required this.userName,
    required this.pass,
    required this.userKind,
    required this.userType,
    required this.speciality,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    idUserType: json["id_user_type"],
    userName: json["user_name"],
    pass: json["Pass"],
    userKind: json["user_kind"],
    userType: json["user_type"],
    speciality: json["speciality"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user_type": idUserType,
    "user_name": userName,
    "Pass": pass,
    "user_kind": userKind,
    "user_type": userType,
    "speciality": speciality,
  };
}
