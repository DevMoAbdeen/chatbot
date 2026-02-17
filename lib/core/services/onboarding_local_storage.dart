import "../../infrastructure/local_storage_controller.dart";

class OnboardingLocalStorage {
  final LocalStorageController localStorage;

  OnboardingLocalStorage({required this.localStorage});

  Future<void> setCompleted() async {
    await localStorage.setData(key: Keys.onboardingCompleted, value: true);
  }

  bool isCompleted() {
    return localStorage.isKeyExist(key: Keys.onboardingCompleted) &&
        localStorage.getData(key: Keys.onboardingCompleted) == true;
  }
}
