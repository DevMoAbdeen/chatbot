import "dart:developer";
import "package:dio/dio.dart";
import "../../constants/api_keys.dart";
import "../../services/environment_controller.dart";

class ApiInterceptor extends Interceptor {
  final EnvironmentController environment;

  ApiInterceptor({required this.environment});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> requestHeaders = {
      "Content_Type": "application/json",
      "Accept": "application/json",
    };

    final apiKey = environment.getEnvValue(EnvironmentKeys.geminiApiKey);
    options.headers = requestHeaders;
    options.queryParameters[ApiKeys.geminiApiKey] = apiKey;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("Response is: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("Error [${err.response?.statusCode}]: ${err.message}");

    super.onError(err, handler);
  }
}
