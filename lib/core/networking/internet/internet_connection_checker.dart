import "package:internet_connection_checker/internet_connection_checker.dart";
import "internet_controller.dart";

final class InternetConnectionCheckerController implements InternetController {
  final _checker = InternetConnectionChecker.instance;

  @override
  Future<bool> get isConnected => _checker.hasConnection;

  @override
  Stream<bool> get onConnectionChange => _checker.onStatusChange.map(
    (status) => status == InternetConnectionStatus.connected,
  );
}
