import 'package:ttk/src/configs/api_constants.dart';
import 'package:ttk/src/models/user.dart';
import 'package:ttk/src/utils/api_base_helper.dart';
import 'package:ttk/src/utils/shared_preferences_data_provider.dart';

class AuthRepository {
  late final ApiBaseHelper _api = ApiBaseHelper();

  late final _preferences = SharedPreferencesDataProvider();

  Future<String> getAccessToken() async {
    return await _preferences.getAccessToken();
  }

  Future<void> saveAccessToken(String token) async {
    _preferences.saveAccessToken(token);
  }

  ///API Services working
  Future<UserLoginResponse> login(String token) async {
    var body = {'token': token};
    final response = await _api.post(ApiConstants.login, body: body);
    return UserLoginResponse.fromJson(response);
  }

  ///API Services working
  Future<UserLoginResponse> register(String role, String name, String lastName,
      String email, String phone) async {
    var body = {
      'type': role,
      'email': email,
      'number': phone,
      'name': name,
      'password': '$phone$email',
      'lname': lastName
    };
    print(body);
    final response =
        await _api.post(ApiConstants.register, body: body, headers: {});
    return UserLoginResponse.fromJson(response);
  }
}
