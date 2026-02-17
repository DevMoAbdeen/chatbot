import "package:flutter/material.dart";
import "../../core/extensions/screen_size_extension.dart";
import "../theme/app_colors.dart";
import "app_text.dart";

class ErrorDisplayWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorDisplayWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.errorSnackBarColor,
                size: 85,
              ),
              AppText(
                text: "An error occurred!",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyMedium!.color,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              AppText(
                text: errorMessage,
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyMedium!.color,
                horizontalPadding: 16,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
