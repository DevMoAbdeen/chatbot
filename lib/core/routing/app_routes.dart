import "package:flutter/material.dart";
import "../../core/extensions/navigation_extension.dart";
import "../../features/chat/presentation/screens/chat_screen.dart";
import "../../features/onboarding/presentation/screens/onboarding_screen.dart";
import "../../features/splash/presentation/screens/splash_screen.dart";
import "../app_widgets/app_bar_widget.dart";
import "../app_widgets/app_text.dart";
import "router_list.dart";

abstract class AppRoutes {
  static List<String> supportedLanguages = ["en", "ar"];

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterList.splashScreen:
        return _buildRoute(settings, screen: const SplashScreen());

      case RouterList.onboardingScreen:
        return _buildRoute(settings, screen: const OnboardingScreen());

      case RouterList.chatScreen:
        return _buildRoute(settings, screen: const ChatScreen());

      default:
        return _errorRoute(settings.name ?? "null");
    }
  }

  static MaterialPageRoute _buildRoute(
    RouteSettings settings, {
    required Widget screen,
  }) {
    return MaterialPageRoute(
      builder: (context) => screen,
      settings: settings,
    );
  }

  static Route _errorRoute(String routeName) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: appBarWidget(
            context: context,
            textTitle: "Page not found",
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                AppText(
                  text: "No route in app defined for: $routeName",
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  horizontalPadding: 16,
                ),
                ElevatedButton.icon(
                  onPressed: () => context.pop(),
                  label: const AppText(text: "Go Back"),
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
