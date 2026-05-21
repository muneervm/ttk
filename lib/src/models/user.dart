import 'package:ttk/src/utils/app_validator.dart';

class UserResponse {
  UserResponse({
    this.success = false,
    this.user = const User(),
    this.message = '',
  });

  final bool success;
  final User user;
  final String message;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    bool success = json["success"] ?? false;
    if (success) {
      return UserResponse(
        success: success,
        user: User.fromJson(json["user"]),
      );
    } else {
      return UserResponse(
        success: success,
        message: (json["message"] ?? '') +
            (json['errors'] != null ? parseErrorMessage(json['errors']) : ""),
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
      };
}

String parseErrorMessage(Map<String, dynamic> errors) {
  String message = "\n";

  String email = message = errors['email'] == null
      ? ''
      : errors['email'].reduce((value, element) => value + ',' + element);
  String mobile = message = errors['mobile'] == null
      ? ''
      : errors['mobile'].reduce((value, element) => value + ',' + element);
  String name = message = errors['name'] == null
      ? ''
      : errors['name'].reduce((value, element) => value + ',' + element);

  message = !AppValidator.isNull(email) ? '\n' + email : '';
  message = message + (!AppValidator.isNull(name) ? '\n' + name : '');
  message = message + (!AppValidator.isNull(mobile) ? '\n' + mobile : '');

  return message;
}

class UserLoginResponse {
  UserLoginResponse({
    this.success = false,
    this.accessToken = '',
    this.tokenType = '',
    this.message = '',
    this.user = const User(),
  });

  final bool success;
  final String accessToken;
  final String tokenType;
  final String message;
  final User user;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    bool success = json["success"] ?? false;
    if (success) {
      User user =
          json["user"] != null ? User.fromJson(json["user"]) : const User();
      return UserLoginResponse(
        success: success,
        accessToken: json["access_token"] ?? '',
        tokenType: json["token_type"] ?? '',
        user: user,
      );
    } else {
      return UserLoginResponse(
          success: success, message: (json["message"] ?? '') +
          (json['errors'] != null ? parseErrorMessage(json['errors']) : ""));
    }
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "access_token": accessToken,
        "token_type": tokenType,
        "user": user.toJson(),
      };
}

class User {
  const User({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.token = '',
    this.mobile = '',
    this.type = '',
    this.date = '',
    this.status = 0,
  });

  final int id;
  final String name;
  final String email;
  final String token;
  final String mobile;
  final String type;
  final String date;
  final int status;


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      email: json["email"] ?? '',
      mobile: json["number"] ?? '',
      type: json["type"] ?? '',
      token: json["token"] ?? '',
      date: json["date"] ?? '',
      status: json["status"] ?? -1,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "number": mobile,
        "type": type,
        "status": status,
        "token": token,
        "date": date,
      };

  @override
  bool operator ==(Object other) {
    return id == (other as User).id;
  }

  @override
  int get hashCode => Object.hash(id, name);
}

enum SubscriptionStatus { expired, active }
