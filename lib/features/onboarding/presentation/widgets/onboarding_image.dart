import "package:flutter/material.dart";

class OnboardingImage extends StatelessWidget {
  final bool isLargeScreen;

  const OnboardingImage({super.key, this.isLargeScreen = false});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/onboarding.webp",
      width: isLargeScreen ? null : 320,
      height: isLargeScreen ? null : 324,
      fit: BoxFit.cover,
    );
  }
}
