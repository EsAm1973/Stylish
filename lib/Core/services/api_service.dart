import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = 'https://api.escuelajs.co/api/v1/';

  ApiService({Dio? dio})
    : dio =
          dio ??
          Dio(BaseOptions(headers: {'Content-Type': 'application/json'}));

  Future<dynamic> get(String endPoint, {Map<String, dynamic>? headers}) async {
    final fullUrl = '$baseUrl$endPoint';
    final response = await dio.get(fullUrl, options: Options(headers: headers));
    return response.data;
  }

  Future<dynamic> post(
    String endPoint,
    dynamic data, {
    Map<String, dynamic>? headers,
  }) async {
    final fullUrl = '$baseUrl$endPoint';
    final response = await dio.post(
      fullUrl,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
