import "package:flutter/material.dart";

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight fontWeight;
  final bool isUpperCase;
  final Color? color;
  final int? maxLines;
  final TextOverflow overflow;
  final TextAlign? textAlign;
  final bool isUnderline;
  final bool isLineThrough;
  final double verticalPadding;
  final double horizontalPadding;

  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontFamily,
    this.fontWeight = FontWeight.normal,
    this.isUpperCase = false,
    this.color,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.isUnderline = false,
    this.isLineThrough = false,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        maxLines: maxLines,
        overflow: maxLines != null ? overflow : TextOverflow.visible,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily ?? "Nunito",
          color: color,
          fontWeight: fontWeight,
          decoration: TextDecoration.combine([
            if (isUnderline) TextDecoration.underline,
            if (isLineThrough) TextDecoration.lineThrough,
          ]),
        ),
      ),
    );
  }
}
