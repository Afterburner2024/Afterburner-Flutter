import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({String baseUrl = 'http://localhost:8080'})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: const {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            connectTimeout: Duration(seconds: 10),
            receiveTimeout: Duration(seconds: 10),
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          // TODO: handle unauthorized globally
        }
        return handler.next(e);
      }),
    );
  }

  Dio get dio => _dio;

  Future<void> fetchCsrfToken() async {
    final res = await _dio.get('/csrf-token');
    final token = res.data['token'];
    if (token != null) {
      _dio.options.headers['X-XSRF-TOKEN'] = token;
    }
  }
}
