import "package:dio/dio.dart";
import "../../constants/api_keys.dart";
import "../../services/environment_controller.dart";
import "../error/app_exception.dart";
import "api_controller.dart";
import "api_interceptor.dart";

class DioController implements ApiController {
  final Dio dio;
  final EnvironmentController environment;

  DioController({required this.dio, required this.environment}) {
    dio.options.baseUrl = environment.getEnvValue(EnvironmentKeys.baseUrl);
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.interceptors.add(ApiInterceptor(environment: environment));
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<Map<String, dynamic>> _handleRequest(
      Future<Response> Function() requestFunc,
      ) async {
    try {
      final response = await requestFunc();
      return response.data;
    } on DioException catch (e) {
      return _handleDioExceptions(e);
    } catch (error) {
      throw const UnexpectedException();
    }
  }

  @override
  Future<Map<String, dynamic>> post(
      String path, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false,
      }) {
    return _handleRequest(() => dio.post(
      path,
      data: isFormData ? FormData.fromMap(body ?? {}) : body,
      queryParameters: queryParameters,
    ));
  }


  dynamic _handleDioExceptions(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const TimeOutException();

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final responseData = e.response?.data;

        final serverMessage = responseData?[ApiKeys.error]?[ApiKeys.message] as String?;

        switch (statusCode) {
          case 400: // Bad Request
            throw BadRequestException(serverMessage ?? "Invalid data was sent to the server.");
          case 401: // Unauthorized
          case 403: // Forbidden
            throw const UnauthorizedException();
          case 404: // Not Found
            throw const NotFoundException();
          case 500: // Internal Server Error
          default:
            throw ServerException(serverMessage ?? "An error occurred on the server.");
        }

      case DioExceptionType.cancel:
        throw const RequestCancelledException();

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw const NoInternetException();
      case DioExceptionType.badCertificate:
        throw const ServerException("Bad certificate. The server's security certificate is not trusted.");

    }
  }

}
