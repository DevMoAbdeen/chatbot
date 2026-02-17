import "package:flutter/material.dart";
import "../../domain/entities/chat_message.dart";

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final List<ChatMessage> messages;
  final bool isEnabled;
  final VoidCallback onMessageSent;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.messages,
    required this.isEnabled,
    required this.onMessageSent,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        decoration: InputDecoration(
          hintText: "Write your message",
          filled: true,
          fillColor: colorScheme.surface,
          suffixIcon: IconButton(
            onPressed: onMessageSent,
            icon: const Icon(Icons.send),
            color: colorScheme.primary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
            fontFamily: "Nunito",
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        textInputAction: TextInputAction.newline,
        maxLines: 4,
        minLines: 1,
      ),
    );
  }
}
