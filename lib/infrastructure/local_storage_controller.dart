enum Keys { onboardingCompleted, languageCode, isDarkMode }

abstract class LocalStorageController {
  Future<void> init();

  Future<bool> setData({required Keys key, required var value});

  dynamic getData({required Keys key});

  Future<bool> removeData({required Keys key});

  bool isKeyExist({required Keys key});

  Future<bool> clearAllData();
}
