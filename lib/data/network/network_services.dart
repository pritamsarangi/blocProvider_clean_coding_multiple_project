import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkServicesApi implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    // TODO: implement getApi
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('Time out try again');
    }
    return jsonResponse;
  }

  Future<dynamic> deleteApi(String url) async {
    dynamic jsonResponse;
    // TODO: implement getApi
    try {
      final response =
      await http.delete(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, data) async {
    dynamic jsonResponse;
    if (kDebugMode) {
      print(url);
      print(data);
    }
    // TODO: implement getApi
    try {
      final response =
      await http.post(Uri.parse(url),
      body: data,
      ).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw RequestTimeOutException('Time out try again');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    if(kDebugMode){
      print(response.statusCode);
    }
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorizedException();
      case 500:
        throw FetchDataException(
            'Error communicating with server' + response.statusCode.toString());
    }
  }
}