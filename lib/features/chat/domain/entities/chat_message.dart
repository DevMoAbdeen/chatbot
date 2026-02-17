import "../../data/models/gemini_response_model.dart";

enum MessageStatus { sending, sent, failed }

enum MessageRole {
  user,
  model;

  factory MessageRole.fromString(String role) {
    switch (role) {
      case "user":
        return MessageRole.user;
      case "model":
        return MessageRole.model;
      default:
        return MessageRole.model;
    }
  }
}

class ChatMessage {
  final String id;
  final MessageRole role;
  final String text;
  final DateTime dateTime;
  final MessageStatus status;

  ChatMessage({
    required this.id,
    required this.role,
    required this.text,
    required this.dateTime,
    this.status = MessageStatus.sent,
  });

  bool get isSentByMe => role == MessageRole.user;
  bool get isFailed => status == MessageStatus.failed;

  factory ChatMessage.fromResponse(GeminiResponseModel response) {
    return ChatMessage(
      id: response.responseId,
      role: MessageRole.model,
      text: response.firstText ?? "",
      dateTime: DateTime.now(),
    );
  }

  factory ChatMessage.fromUserInput(String text) {
    return ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      role: MessageRole.user,
      text: text,
      dateTime: DateTime.now(),
      status: MessageStatus.sending,
    );
  }

  ChatMessage copyWith({MessageStatus? status}) {
    return ChatMessage(
      id: id,
      role: role,
      text: text,
      // If message failed, update the dateTime to now when resending it.
      dateTime:
          this.status == MessageStatus.failed && status == MessageStatus.sending
          ? DateTime.now()
          : dateTime,
      status: status ?? this.status,
    );
  }
}
