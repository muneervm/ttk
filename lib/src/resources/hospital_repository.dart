import 'package:ttk/src/configs/api_constants.dart';
import 'package:ttk/src/models/hospital.dart';
import 'package:ttk/src/models/order.dart';
import 'package:ttk/src/models/position.dart';
import 'package:ttk/src/models/success.dart';
import 'package:ttk/src/models/surgeon.dart';
import 'package:ttk/src/models/user.dart';
import 'package:ttk/src/resources/auth_repository.dart';
import 'package:ttk/src/utils/api_base_helper.dart';
import 'package:ttk/src/utils/shared_preferences_data_provider.dart';

class HospitalRepository {
  late final _preferences = SharedPreferencesDataProvider();
  late final _api = ApiBaseHelper();

  Future<HospitalResponse> getHospitals() async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    final response = await _api.get(ApiConstants.hospitals, headers: headers);
    return HospitalResponse.fromJson(response);
  }

  Future<PostResponse> saveHospital(String name,
      {String address = '', String email = '', String contact = ''}) async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    var body = {
      'hospital': name,
      'address': address,
      'email': email,
      'contact': contact
    };
    final response = await _api.post(ApiConstants.hospitalSave,
        headers: headers, body: body);

    return PostResponse.fromJson(response);
  }

  Future<SurgeonResponse> getSurgeons() async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    final response = await _api.get(ApiConstants.surgeons, headers: headers);
    return SurgeonResponse.fromJson(response);
  }

  Future<PostResponse> saveSurgeon(String name) async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    var body = {'name': name};
    final response =
        await _api.post(ApiConstants.surgeonSave, headers: headers, body: body);

    return PostResponse.fromJson(response);
  }

  Future<PositionResponse> getValvePositions() async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    final response =
        await _api.get(ApiConstants.valvePosition, headers: headers);
    return PositionResponse.fromJson(response);
  }

  Future<PostResponse> saveOrder(Map<String, String> data) async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    // Backend reads data as standard JSON POST body (same as Postman raw JSON)
    final response = await _api.post(
      ApiConstants.order,
      headers: headers,
      body: data,
    );
    return PostResponse.fromJson(response);
  }

//api working
  Future<OrderResponse> getOrders() async {
    String token = await AuthRepository().getAccessToken();
    var headers = {'Authorization': token};
    final response = await _api.get(ApiConstants.orders, headers: headers);
    return OrderResponse.fromJson(response);
  }
}
