import "package:flutter/material.dart";
import "../../../../core/extensions/sized_box_extension.dart";
import "continue_button.dart";
import "onboarding_texts_column.dart";

class OnboardingWidePanel extends StatelessWidget {
  final VoidCallback onPressed;

  const OnboardingWidePanel({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(child: SingleChildScrollView(child: OnboardingTextsColumn())),
        16.heightSpace(),
        ContinueButton(onPressed: onPressed),
        16.heightSpace(),
      ],
    );
  }
}
