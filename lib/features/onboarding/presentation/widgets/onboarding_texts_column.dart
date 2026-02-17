import "package:flutter/material.dart";
import "../../../../core/app_widgets/app_text.dart";
import "../../../../core/extensions/screen_size_extension.dart";
import "../../../../core/extensions/sized_box_extension.dart";

class OnboardingTextsColumn extends StatelessWidget {
  const OnboardingTextsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: "Your AI Assistant",
          fontSize: 23,
          color: theme.colorScheme.primary,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
        ),
        12.heightSpace(),
        AppText(
          text: "Using this software, you can ask you\nquestions and receive articles using\nartificial intelligence assistant",
          fontSize: context.scaleText(15),
          color: theme.textTheme.bodyMedium?.color,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          horizontalPadding: 32,
        ),
      ],
    );
  }
}
