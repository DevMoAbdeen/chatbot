import "package:flutter/material.dart";
import "chatbot_app.dart";
import "core/services/dependency_injection.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(const ChatBotApp());
}