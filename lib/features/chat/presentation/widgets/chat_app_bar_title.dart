import "package:flutter/material.dart";
import "../../../../core/app_widgets/app_text.dart";
import "../../../../core/extensions/sized_box_extension.dart";

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Image.asset("assets/icons/chatbot.webp", width: 24, height: 36),
        8.widthSpace(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "gemini",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
            const Row(
              spacing: 6,
              children: [
                CircleAvatar(radius: 4, backgroundColor: Colors.green),
                AppText(
                  text: "Online",
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
