import 'package:dio/dio.dart';
import 'package:utils/data/models/logged_in_user.dart';
import '../api_const/app_api.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  AuthInterceptor(this.dio);


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final listOfPaths = <String>[
      '${AppAPI.baseUrl}/auth/admin/login',
    ];

    if (listOfPaths.contains(options.path.toString())) {
      return handler.next(options);
    }

    // Get token using the modified CacheService
    String? token = LoggedInUser.accessToken;

    if (token == null || token.isEmpty) {
      // Handle case where token is not available
      print("No token found");
      // You might want to redirect to login or handle this case appropriately
      return handler.next(options);
    }

    options.headers.addAll({'Authorization': 'Bearer $token'});
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options
    );
  }
}