import "../../../../core/constants/api_urls.dart";
import "../../domain/entities/chat_message.dart";
import "../models/gemini_request_model.dart";
import "../models/gemini_response_model.dart";
import "chat_service.dart";

class GeminiChatService extends ChatService {
  GeminiChatService({required super.apiController});

  @override
  Future<ChatMessage> sendMessage(List<ChatMessage> messages) async {
    GeminiRequestModel request = GeminiRequestModel.fromChatMessages(messages);

    final response = await apiController.post(
      ApiURLs.sendMessage,
      body: request.toJson(),
    );

    GeminiResponseModel responseModel = GeminiResponseModel.fromJson(response);
    return ChatMessage.fromResponse(responseModel);
  }
}
