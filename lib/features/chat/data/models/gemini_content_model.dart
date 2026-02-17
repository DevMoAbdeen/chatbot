import "../../../../core/constants/api_keys.dart";
import "../../domain/entities/chat_message.dart";
import "gemini_part_model.dart";

class GeminiContentModel {
  final MessageRole role;
  final List<GeminiPartModel> parts;

  GeminiContentModel({required this.role, required this.parts});

  factory GeminiContentModel.fromJson(Map<String, dynamic> json) {
    return GeminiContentModel(
      role: MessageRole.fromString(json[ApiKeys.role]),
      parts:
          (json[ApiKeys.parts] as List<dynamic>?)
              ?.map((partJson) => GeminiPartModel.fromJson(partJson))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.role: role.name,
      ApiKeys.parts: parts.map((part) => part.toJson()).toList(),
    };
  }
}
