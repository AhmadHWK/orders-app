class UserModel {
  final bool status;
  final UserData data;

  UserModel({required this.status, required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      status: json['status'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final User user;
  final String token;

  UserData({required this.user, required this.token});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
    };
  }
}

class User {
  final int id;
  final String? email;
  final String firstName;
  final String lastName;
  final String position;
  final String? image;
  final String? lat;
  final String? lng;
  final String phoneNumber;
  final String wallet;
  final String? rememberToken;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    this.email,
    required this.firstName,
    required this.lastName,
    required this.position,
    this.image,
    this.lat,
    this.lng,
    required this.phoneNumber,
    required this.wallet,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      position: json['position'],
      image: json['image'],
      lat: json['lat'],
      lng: json['lng'],
      phoneNumber: json['phone_number'],
      wallet: json['wallet'],
      rememberToken: json['remember_token'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'position': position,
      'image': image,
      'lat': lat,
      'lng': lng,
      'phone_number': phoneNumber,
      'wallet': wallet,
      'remember_token': rememberToken,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
