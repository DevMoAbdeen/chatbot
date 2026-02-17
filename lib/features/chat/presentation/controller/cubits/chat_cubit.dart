import "package:flutter_bloc/flutter_bloc.dart";
import "../../../domain/entities/chat_message.dart";
import "../../../domain/repositories/chat_repository.dart";
import "../states/chat_state.dart";

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit({required ChatRepository chatRepository})
    : _chatRepository = chatRepository,
      super(ChatInitial());

  void sendMessage(List<ChatMessage> messages) async {
    if(state is ChatLoading) return; // Prevent multiple sends

    emit(ChatLoading());
    final messagesSent = messages.where((message) => !message.isFailed).toList();
    final result = await _chatRepository.sendMessage(messagesSent);
    result.fold(
      (failure) {
        emit(ChatFailure(errorMessage: failure.message));
      },
      (botMessage) {
        emit(ChatSuccess(message: botMessage));
      },
    );
  }
}
