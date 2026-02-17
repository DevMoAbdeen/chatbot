import "../../../../core/constants/api_keys.dart";
import "gemini_content_model.dart";

class GeminiResponseModel {
  final List<CandidateModel> candidates;
  final String responseId;

  GeminiResponseModel({required this.candidates, required this.responseId});

  // Helper getter to get the text, if it exists
  String? get firstText {
    if (candidates.isEmpty) return null;
    final parts = candidates.first.content.parts;
    if (parts.isEmpty) return null;
    return parts.first.text;
  }

  factory GeminiResponseModel.fromJson(Map<String, dynamic> json) {
    return GeminiResponseModel(
      candidates: (json[ApiKeys.candidates] as List<dynamic>? ?? [])
          .map((item) => CandidateModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      responseId: json[ApiKeys.responseId] as String? ?? "",
    );
  }
}

///////////////////

enum FinishReason {
  stop,
  length,
  contentFilter,
  unknown;

  factory FinishReason.fromString(String? reason) {
    switch (reason?.toUpperCase()) {
      case "STOP":
        return FinishReason.stop;
      case "LENGTH":
        return FinishReason.length;
      case "CONTENT_FILTER":
        return FinishReason.contentFilter;
      default:
        return FinishReason.unknown;
    }
  }
}

class CandidateModel {
  final GeminiContentModel content;
  final FinishReason finishReason;

  CandidateModel({required this.content, required this.finishReason});

  factory CandidateModel.fromJson(Map<String, dynamic> json) {
    return CandidateModel(
      content: GeminiContentModel.fromJson(json[ApiKeys.content] ?? {}),
      finishReason: FinishReason.fromString(json[ApiKeys.finishReason]),
    );
  }
}
