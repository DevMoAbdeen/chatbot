import "../../../../core/constants/api_keys.dart";

class GeminiPartModel {
  final String text;
  final String? thoughtSignature;

  const GeminiPartModel({required this.text, this.thoughtSignature});

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.text: text,
      if (thoughtSignature != null) ApiKeys.thoughtSignature: thoughtSignature,
    };
  }

  factory GeminiPartModel.fromJson(Map<String, dynamic> json) {
    return GeminiPartModel(
      text: json[ApiKeys.text],
      thoughtSignature: json[ApiKeys.thoughtSignature],
    );
  }
}
