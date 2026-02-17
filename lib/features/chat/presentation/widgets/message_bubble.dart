import "package:flutter/material.dart";
import "../../../../core/app_widgets/app_text.dart";
import "../../../../core/extensions/date_time_extension.dart";
import "../../../../core/extensions/screen_size_extension.dart";
import "../../../../core/extensions/sized_box_extension.dart";
import "../../domain/entities/chat_message.dart";

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback? onRetry;

  const MessageBubble({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = context.screenWidth;
    final bubbleColor = message.isFailed
        ? colorScheme.errorContainer.withValues(alpha: 0.1)
        : message.isSentByMe
          ? colorScheme.primary.withValues(alpha: 0.85)
          : colorScheme.primary.withValues(alpha: 0.15);

    final textColor = message.isFailed
        ? colorScheme.errorContainer
        : message.isSentByMe
          ? colorScheme.surface
          : colorScheme.onSurface;

    return Align(
      alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: screenWidth * 0.85),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(message.isSentByMe ? 16 : 0),
            topRight: Radius.circular(message.isSentByMe ? 0 : 16),
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),
          ),
          border: message.isFailed
              ? Border.all(
                  color: colorScheme.errorContainer,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: message.text, fontSize: 15, color: textColor),
            6.heightSpace(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.dateTime.to12HourFormatWithPeriod(),
                  style: TextStyle(
                    fontSize: 11,
                    color: !message.isSentByMe || message.isFailed
                        ? Colors.grey.shade600
                        : colorScheme.surface.withValues(alpha: 0.7),
                  ),
                ),
                if (message.isFailed && onRetry != null) ...[
                  12.widthSpace(),
                  InkWell(
                    onTap: onRetry,
                    child: Row(
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.refresh,
                          size: 18,
                          color: colorScheme.errorContainer,
                        ),
                        Text(
                          "Resend Message",
                          style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.errorContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
