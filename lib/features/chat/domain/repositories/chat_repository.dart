import "package:dartz/dartz.dart";
import "../../../../core/networking/error/app_exception.dart";
import "../entities/chat_message.dart";

abstract class ChatRepository {
  Future<Either<AppException, ChatMessage>> sendMessage(
    List<ChatMessage> messages,
  );
}
