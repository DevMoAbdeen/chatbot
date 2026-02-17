import "package:flutter/material.dart";
import "core/app_widgets/error_display_widget.dart";
import "core/routing/app_routes.dart";
import "core/routing/router_list.dart";
import "core/theme/app_themes.dart";

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return Material(
            child: SafeArea(
              child: ErrorDisplayWidget(
                errorMessage: errorDetails.exceptionAsString(),
              ),
            ),
          );
        };
        return child!;
      },
      title: "ChatBot App",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: RouterList.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
