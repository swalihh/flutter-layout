
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../error/exception.dart';
import '../error/failure.dart';
import '../utilities/typedef.dart';
import 'app_api.dart';

abstract class BaseApi {
  final Dio dio;

  BaseApi({required this.dio});

  ResultFuture<dynamic> request({
    required String method,
    required String subUrl,
    dynamic data,
    dynamic queryData,
    bool fromRoot = false,
  }) async {
    try {
      final String uri = AppAPI.baseUrl + subUrl;
      Response response;
      switch (method) {
        case 'GET':
          response = await dio.get(uri, queryParameters: queryData , options: Options(validateStatus: (status) => true,));
          break;
        case 'POST':
          response = await dio.post(uri, data: data, options: Options(validateStatus: (status) => true,));
          break;
        case 'PATCH':
          response = await dio.patch(uri, data: data, options: Options(validateStatus: (status) => true,));
          break;
        case 'DELETE':
          response = await dio.delete(uri, data: data, options: Options(validateStatus: (status) => true,));
          break;
        default:
          throw UnsupportedError('Unsupported HTTP method: $method');
      }
      final responseData = response.data;
      final message = responseData['message'];
      final statusCode = responseData['statusCode'];
      if (statusCode == 200) {
        if (fromRoot) {
          return Right(responseData);
        } else {
          return Right(responseData['result']);
        }
      } else {
        return Left(APIFailure(message: message, statusCode: statusCode));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final dynamic responseData = e.response!.data;
        final String errorMessage =
            responseData['message'] ?? 'An error occurred';
        final int statusCode = e.response!.statusCode ?? 400;

        return Left(APIFailure(message: errorMessage, statusCode: statusCode));
      } else {
        return Left(
            APIFailure(message: 'DioError: ${e.message}', statusCode: 502));
      }
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    } on CacheException catch (e) {
      return Left(APIFailure(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(APIFailure(
          message: 'Unexpected error: ${e.toString()}', statusCode: 500));
    }
  }
}
