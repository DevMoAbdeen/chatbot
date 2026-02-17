abstract class InternetController {
  Future<bool> get isConnected;

  Stream<bool> get onConnectionChange;
}
