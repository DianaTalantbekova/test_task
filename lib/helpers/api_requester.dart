import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_task/helpers/catchException.dart';

class ApiRequester {
  static String url = 'https://rickandmortyapi.com/api';
  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        connectTimeout: 30000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    print('message 7');
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: {});
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
