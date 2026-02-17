import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../domain/entities/chat_message.dart";
import "../controller/cubits/chat_cubit.dart";
import "message_bubble.dart";
import "typing_indicator.dart";

class MessagesList extends StatelessWidget {
  final ScrollController scrollController;
  final List<ChatMessage> messages;
  final bool showTypingIndicator;

  const MessagesList({
    super.key,
    required this.scrollController,
    required this.messages,
    this.showTypingIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const Key("MessagesList"),
      reverse: true,
      controller: scrollController,
      itemCount: messages.length + (showTypingIndicator ? 1 : 0),
      itemBuilder: (context, index) {
        if (showTypingIndicator && index == 0) {
          return const TypingIndicator();
        }

        // If the typing indicator is shown, we need to adjust the index to skip it
        final adjustedIndex = showTypingIndicator ? index - 1 : index;
        final messageIndex = messages.length - 1 - adjustedIndex;

        return MessageBubble(
          key: Key(messages[messageIndex].id),
          message: messages[messageIndex],
          onRetry: () {
            // Don't allow retrying if the typing indicator is shown,
            // as it means a message is currently being sent
            if(showTypingIndicator) return;
            ChatMessage msg = messages[messageIndex];
            messages.remove(msg);
            msg = msg.copyWith(status: MessageStatus.sending);
            messages.add(msg);
            context.read<ChatCubit>().sendMessage(messages);
          },
        );
      },
    );
  }
}
