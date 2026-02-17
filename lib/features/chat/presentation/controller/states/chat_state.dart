import "../../../domain/entities/chat_message.dart";

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {
  final ChatMessage message;

  ChatSuccess({required this.message});
}

final class ChatFailure extends ChatState {
  final String errorMessage;

  ChatFailure({required this.errorMessage});
}
