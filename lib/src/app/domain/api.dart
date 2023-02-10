import 'package:dio/dio.dart';
import 'package:space_coding/src/app/domain/errors.dart';
import 'package:space_coding/src/app/utils/utils.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: Utils().urlApi));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Utils().urlApi,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
      contentType: 'application/json; charset=UTF-8',
      headers: {
        'Accept' : 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}


