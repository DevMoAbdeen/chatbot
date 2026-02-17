import "../../../../core/networking/api/api_controller.dart";
import "../../domain/entities/chat_message.dart";

abstract class ChatService {
  final ApiController apiController;

  ChatService({required this.apiController});

  Future<ChatMessage> sendMessage(List<ChatMessage> messages);
}
