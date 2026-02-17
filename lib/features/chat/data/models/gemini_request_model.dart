import "../../../../core/constants/api_keys.dart";
import "../../domain/entities/chat_message.dart";
import "gemini_content_model.dart";
import "gemini_part_model.dart";

class GeminiRequestModel {
  final List<GeminiContentModel> contents;

  GeminiRequestModel({required this.contents});

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.contents: contents.map((content) => content.toJson()).toList(),
    };
  }

  factory GeminiRequestModel.fromChatMessages(List<ChatMessage> messages) {
    List<GeminiContentModel> contents = messages.map((message) {
      return GeminiContentModel(
        role: message.role,
        parts: [GeminiPartModel(text: message.text)],
      );
    }).toList();

    return GeminiRequestModel(contents: contents);
  }
}
