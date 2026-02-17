import "package:flutter/services.dart" show rootBundle;
import "dart:async";

enum EnvironmentKeys {
  baseUrl("BASE_URL"),
  geminiApiKey("GEMINI_API_KEY");

  final String description;

  const EnvironmentKeys(this.description);
}

final class EnvironmentController {
  static final EnvironmentController _instance = EnvironmentController._internal();
  final Map<String, String> _envMap = <String, String>{};

  factory EnvironmentController() {
    return _instance;
  }

  EnvironmentController._internal();

  Future<void> loadEnvFile() async {
    if (_envMap.isNotEmpty) return;

    final String content = await rootBundle.loadString("assets/env/.env");
    _parseEnv(content);
  }

  void _parseEnv(String content) {
    final List<String> lines = content.split("\n");
    for (String line in lines) {
      if (line.trim().isEmpty || line.trim().startsWith("#")) continue;

      final List<String> parts = line.split("=");
      if (parts.length == 2) {
        _envMap[parts[0].trim()] = parts[1].trim().replaceAll(
          RegExp(r'^"|"$'),
          "",
        );
      }
    }
  }

  String getEnvValue(EnvironmentKeys key) {
    if (_envMap.isEmpty) loadEnvFile();

    return _envMap[key.description] ?? "";
  }
}
