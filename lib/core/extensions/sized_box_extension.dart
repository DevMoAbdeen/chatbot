import "package:flutter/material.dart";

extension SizedBoxExtension on num {
  // Create SizedBox with height equal to the numeric value.
  SizedBox heightSpace() => SizedBox(
        height: toDouble(),
      );

  // Create SizedBox with width equal to the numeric value.
  SizedBox widthSpace() => SizedBox(
        width: toDouble(),
      );
}
