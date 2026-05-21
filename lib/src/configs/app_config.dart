class AppConfig {
  static const String baseUrl = 'https://ttkhvdapp.com';
  static const String baseApiUrl = baseUrl + '/TTK';
  static const String baseStorageUrl = baseUrl + '/storage';
  static const Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  static const Map<String, String> headersMultipart = {
    //'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };
  /*static const Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };*/
}
