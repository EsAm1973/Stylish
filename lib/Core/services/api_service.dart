import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<dynamic> get(String endPoint, {Map<String, dynamic>? headers}) async {
    final response = await dio.get(
      endPoint,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> post(
    String endPoint,
    dynamic data, {
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(
      endPoint,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> put(
    String endPoint,
    dynamic data, {
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.put(
      endPoint,
      data: data,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> delete(
    String endPoint, {
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.delete(
      endPoint,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
