import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:school_profile/index.dart';

class ApisCaller {
  ApisCaller._() {
    dio = Dio(
      BaseOptions(
        connectTimeout: 20000,
        receiveTimeout: 20000,
      ),
    );
  }

  static final instance = ApisCaller._();

  late Dio dio;

  Future<T> getData<T>({
    required String path,
    required Map<String, String>? queryParameters,
    required T Function(dynamic data) builder,
  }) async {
    try {
      Response response = await dio.get(path, queryParameters: queryParameters);
      return builder(response.data);
    } catch (e) {
      debugPrint(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      final _failure = ServerFailure(message: _errorMessage);
      return builder(_failure);
    }
  }
}
