import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService() : _dio = Dio(BaseOptions(baseUrl: baseUrl));
  Future<Map<String, dynamic>> get({required String endpoint}) async{
    var response = await _dio.get('$baseUrl$endpoint');
    return response.data;
  }
}