import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ttk/src/configs/app_config.dart';
import 'package:ttk/src/utils/app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = AppConfig.baseApiUrl;

  final Map<String, String> _headers = AppConfig.headers;

  Future<dynamic> get(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      if (headers != null) {
        headers.addAll(_headers);
      }
      var uri =
          Uri.parse(_baseUrl + url).replace(queryParameters: queryParameters);
      final response = await http.get(uri, headers: headers);
      print(uri.toString());
      print(response.statusCode);
      print(response.body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic> body = const {},
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      if (headers != null) {
        headers.addAll(_headers);
      }
      var uri = Uri.parse(
          _baseUrl + url);
      final response = await http.post(uri, body: jsonEncode(body), headers: headers ?? _headers);
      print(uri.toString());
      print(response.statusCode);
      print(response.body);
      print(body);
      responseJson = _returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postLogin(String url,
      {Map<String, dynamic> body = const {},
      Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      if (headers != null) {
        headers.addAll(_headers);
      }
      var uri = Uri.parse(
          _baseUrl + url); /*
      print(json.encode(body).toString());*/
      final response = await http.post(uri, body: body, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postMultipart(String url,
      {Map<String, String>? body,
      Map<String, String>? headers,
      String file = '',
      String file1 = '',
      String file2 = ''}) async {
    dynamic responseJson;
    try {
      var uri = Uri.parse(_baseUrl + url);
      var request = http.MultipartRequest("POST", uri);
      if (headers != null) {
        headers.addAll(_headers);
        request.headers.addAll(headers);
      }
      if (body != null) {
        request.fields.addAll(body);
      }
      if (file.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath("file", file));
      }
      if (file1.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath("file1", file1));
      }
      if (file2.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath("file2", file2));
      }
      var streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.statusCode);
      print(response.body);
      responseJson = _returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic> body = const {},
      Map<String, String> header = const {}}) async {
    dynamic responseJson;
    try {
      header.addAll(_headers);
      var uri = Uri.parse(_baseUrl + url);
      final response = await http.put(uri, body: body, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url,
      {Map<String, String> header = const {}}) async {
    dynamic responseJson;
    try {
      header.addAll(_headers);
      var uri = Uri.parse(_baseUrl + url);
      final response = await http.delete(uri, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  print(response.request?.url);
  print(response.request?.headers);
  print(response.statusCode);
  print(response.body);
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 422:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 500:
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
