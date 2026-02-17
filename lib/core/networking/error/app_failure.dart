import "app_exception.dart";

class AppFailure {
  final String message;

  const AppFailure(this.message);

  factory AppFailure.fromException(Object exception) {
    if (exception is AppException) {
      return AppFailure(exception.message);
    }

    return const AppFailure("An unexpected error occurred. Please contact support.");
  }
}
