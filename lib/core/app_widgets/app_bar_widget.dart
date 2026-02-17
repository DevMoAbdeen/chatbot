import "package:flutter/material.dart";
import "app_text.dart";

AppBar appBarWidget({
  required BuildContext context,
  Widget? titleWidget,
  String? textTitle,
  bool isCenterTitle = true,
  Widget? leadingWidget,
  Color? color,
  List<Widget>? actionWidgets,
}) {
  return AppBar(
    backgroundColor: color ?? Colors.transparent,
    centerTitle: isCenterTitle,
    leading: leadingWidget,
    iconTheme: IconThemeData(
      color: Theme.of(context).iconTheme.color,
    ),
    title: titleWidget ??
        AppText(
          text: textTitle ?? "",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
    actions: actionWidgets,
  );
}
