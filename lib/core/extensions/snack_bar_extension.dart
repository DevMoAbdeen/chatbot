import "package:flutter/material.dart";
import "../app_widgets/app_text.dart";
import "../theme/app_colors.dart";

enum SnackBarType { info, success, error, warning }

extension SnackBarExtension on BuildContext {
  void showSnackBar({
    required String message,
    required SnackBarType type,
    int secondsDuration = 4,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    final Map<SnackBarType, IconData> iconMap = {
      SnackBarType.error: Icons.clear_outlined,
      SnackBarType.warning: Icons.warning,
      SnackBarType.success: Icons.check_circle,
      SnackBarType.info: Icons.info_outline,
    };

    final Map<SnackBarType, Color> colorMap = {
      SnackBarType.error: AppColors.errorSnackBarColor,
      SnackBarType.warning: AppColors.warningSnackBarColor,
      SnackBarType.success: AppColors.successSnackBarColor,
      SnackBarType.info: AppColors.infoSnackBarColor,
    };

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          spacing: 8,
          children: [
            Icon(
              iconMap[type],
              color: Colors.white,
            ),
            Expanded(
              child: AppText(
                text: message,
                fontSize: 15,
                color: Colors.white,
                maxLines: 10,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        backgroundColor: colorMap[type],
        duration: Duration(seconds: secondsDuration),
        dismissDirection: DismissDirection.horizontal,
        behavior: behavior,
      ),
    );
  }
}
