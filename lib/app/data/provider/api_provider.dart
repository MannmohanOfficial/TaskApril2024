import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:user_list/app/data/provider/api_endpoints.dart';

class AppResponse {
  String? message;
  int? responseCode;
  dynamic responseBody;

  AppResponse({this.message, this.responseBody, this.responseCode});
}

class APIProvider {
  late Dio _client;
  static APIProvider get instance => APIProvider();

  APIProvider() {
    _client = Dio(
      BaseOptions(
        baseUrl: APIEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 90),
        receiveTimeout: const Duration(seconds: 60),
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) < 500;
        },
      ),
    );
    _client.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ));
    _client.options.headers = {
      'Authorization': 'Bearer ${APIEndpoints.token}',
    };
  }

  Future<AppResponse> get(String endPoint) async {
    try {
      final response = await _client.get(endPoint);
      return handleAPIResponse(response);
    } catch (e, stackTrace) {
      return handleAPIException(e, stackTrace);
    }
  }

  Future<AppResponse> post(String endPoint, dynamic body) async {
    try {
      final response = await _client.post(endPoint, data: body);
      return handleAPIResponse(response);
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionTimeout) {
        // SnackbarUtils.instance.failureSnackbar("Connection timed out");
        g.Get.snackbar('Time Out', 'Connection timed out');
      }

      return handleAPIException(e, st);
    } catch (e, stackTrace) {
      return handleAPIException(e, stackTrace);
    }
  }

  Future<AppResponse> put(String endPoint, dynamic body) async {
    try {
      final response = await _client.put(endPoint, data: body);
      return handleAPIResponse(response);
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionTimeout) {
        // SnackbarUtils.instance.failureSnackbar("Connection timed out");
        g.Get.snackbar('Time Out', 'Connection timed out');
      }

      return handleAPIException(e, st);
    } catch (e, stackTrace) {
      return handleAPIException(e, stackTrace);
    }
  }

  Future<AppResponse> delete(String endPoint) async {
    try {
      final response = await _client.delete(endPoint);
      return handleAPIResponse(response);
    } catch (e, stackTrace) {
      return handleAPIException(e, stackTrace);
    }
  }

  AppResponse handleAPIResponse(Response response) {
    if (response.statusCode == 200) {
      // if (response.data['status'] != null) {
      //   if (response.data['status'] == 'error') {
      //     return AppResponse(
      //       message: 'success',
      //       responseCode: response.statusCode,
      //       responseBody: response.data,
      //     );
      //   }
      // }
      return AppResponse(
          responseBody: response.data, responseCode: response.statusCode);
    } else {
      return AppResponse(
          message: 'Something went wrong', responseCode: response.statusCode);
    }
  }

  AppResponse handleAPIException(e, stackTrace) {
    log("error =>  $e, trace : $stackTrace");

    return AppResponse(message: 'Oops! Something went wrong.');
  }
}
