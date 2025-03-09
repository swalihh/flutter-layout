import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:utils/core/interceptor/retry_interceptor.dart';
import '../../data/models/logged_in_user.dart';
import '../api_const/app_api.dart';
import 'connectivity_retry_interceptor.dart';
import 'auth_interceptor.dart';

class Api {
  final Dio dio;

  // Private constructor to prevent instantiating Api directly
  Api._internal(this.dio);

  // Singleton instance of Api
  static final _singleton = Api._internal(createDio());

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio();
    dio.options.baseUrl = AppAPI.baseUrl;

    dio.interceptors
      ..add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: true,
      ))
      ..add(AuthInterceptor(dio))
      ..add(RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dio,
          connectivity: Connectivity(),
        ),
      ))
      ..add(InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          _startRequestTimer(options);
          handler.next(options);
        },
        onResponse: (respons, handler) async {
          if (respons.data['statusCode'] == 401) {
            var options = respons.requestOptions;
            await _refreshToken(dio);
            // Retry the failed request with the new token
            options.headers['Authorization'] =
                'Bearer ${LoggedInUser.accessToken}';
            final response = await dio.request(
              options.path,
              options: Options(
                method: options.method,
                headers: options.headers,
              ),
              data: options.data,
              queryParameters: options.queryParameters,
            );
            return handler.resolve(response);
          } else {
            return handler.next(respons);
          }
        },
      ));

    return dio;
  }
}

// Start measuring request time for performance analysis
void _startRequestTimer(RequestOptions options) {
  options.extra['start_time'] = DateTime.now().millisecondsSinceEpoch;
}

// Refresh token if expired
Future<bool> _refreshToken(Dio dio) async {
  try {
    Response response = await dio.post('${AppAPI.baseUrl}/auth/business/token',
        data: json.encode({'refresh_token': LoggedInUser.refreshToken}));
    if (response.statusCode == 201) {
      Map<String, dynamic> data = response.data;
      LoggedInUser.login(data['result']);
      return true;
    } else {
      log('Failed to refresh token');
      return false;
    }
  } catch (e) {
    log('Error during token refresh: $e');
    return false;
  }
}
