import "package:dartz/dartz.dart";
import "../../../../core/networking/error/app_exception.dart";
import "../../../../core/networking/internet/internet_controller.dart";
import "../../domain/entities/chat_message.dart";
import "../../domain/repositories/chat_repository.dart";
import "../services/chat_service.dart";

class ChatRepositoryImpl implements ChatRepository {
  final ChatService _chatService;
  final InternetController _internetController;

  ChatRepositoryImpl({
    required ChatService chatService,
    required InternetController internetController,
  }) : _chatService = chatService,
       _internetController = internetController;

  @override
  Future<Either<AppException, ChatMessage>> sendMessage(
    List<ChatMessage> messages,
  ) async {
    final isConnected = await _internetController.isConnected;

    if (!isConnected) {
      return const Left(NoInternetException());
    }

    try {
      final response = await _chatService.sendMessage(messages);
      return Right(response);
    } on AppException catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(UnexpectedException());
    }
  }
}
