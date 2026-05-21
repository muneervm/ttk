import 'package:ttk/src/configs/api_constants.dart';
import 'package:ttk/src/models/user.dart';
import 'package:ttk/src/resources/auth_repository.dart';
import 'package:ttk/src/utils/api_base_helper.dart';
import 'package:ttk/src/utils/shared_preferences_data_provider.dart';

class UserProfileRepository {
  late final _preferences = SharedPreferencesDataProvider();
  late final _api = ApiBaseHelper();

  Future<User> getUserOffline() async {
    int id = await _preferences.getUserId();
    String name = await _preferences.getUserName();
    String mobile = await _preferences.getUserMobile();
    String type = await _preferences.getUserImage();
    String email = await _preferences.getUserMail();
    return User(id: id, name: name, mobile: mobile, email: email, type: type);
  }

  Future<void> saveUser(User user) async {
    await _preferences.saveUserId(user.id);
    await _preferences.saveUserName(user.name);
    await _preferences.saveUserMobile(user.mobile);
    await _preferences.saveUserImage(user.type);
    await _preferences.saveUserMail(user.email);
  }

  Future<UserResponse> getUser() async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    final response = await _api.get(ApiConstants.user, headers: headers);
    return UserResponse.fromJson(response);
  }

  Future<UserResponse> updateUser(String name, {String image = ''}) async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    var body = {'name': name};
    final dynamic response;
    if (image.isNotEmpty) {
      response = await _api.postMultipart(ApiConstants.user,
          headers: headers, body: body, files: {'file': image});
    } else {
      response =
          await _api.post(ApiConstants.user, headers: headers, body: body);
    }
    return UserResponse.fromJson(response);
  }

  void logout() async {
    await _preferences.clear();
  }
}
