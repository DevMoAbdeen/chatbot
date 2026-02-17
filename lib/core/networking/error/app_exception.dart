sealed class AppException implements Exception {
  final String message;

  const AppException(this.message);
}

class TimeOutException extends AppException {
  const TimeOutException()
    : super("The connection has timed out, please try again.");
}

class NoInternetException extends AppException {
  const NoInternetException()
    : super("No internet connection. Please check your network.");
}

class ServerException extends AppException {
  const ServerException(super.message);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException()
    : super("Unauthorized request. Please check your API key.");
}

class NotFoundException extends AppException {
  const NotFoundException()
    : super("The requested resource was not found on the server.");
}

class BadRequestException extends AppException {
  const BadRequestException(super.message);
}

class UnexpectedException extends AppException {
  const UnexpectedException()
    : super("An unexpected error occurred. Please try again later.");
}

class RequestCancelledException extends AppException {
  const RequestCancelledException() : super("Your request has been cancelled");
}
