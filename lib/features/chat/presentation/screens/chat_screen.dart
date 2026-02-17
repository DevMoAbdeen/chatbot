import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../core/app_widgets/app_bar_widget.dart";
import "../../../../core/extensions/snack_bar_extension.dart";
import "../../../../core/services/dependency_injection.dart";
import "../../domain/entities/chat_message.dart";
import "../controller/cubits/chat_cubit.dart";
import "../controller/states/chat_state.dart";
import "../widgets/chat_app_bar_title.dart";
import "../widgets/chat_input_field.dart";
import "../widgets/messages_list.dart";
import "../widgets/suggestions_content.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatCubit>(),
      child: const ChatView(),
    );
  }
}

class ChatView extends StatefulWidget {

  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late TextEditingController _messageController;
  late ScrollController _scrollController;

  List<ChatMessage> messages = [];

  @override
  void initState() {
    _messageController = TextEditingController();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage(String? text) {
    if (text == null || text.trim().isEmpty) return;
    ChatMessage newMessage = ChatMessage.fromUserInput(text);
    messages.add(newMessage);
    context.read<ChatCubit>().sendMessage(messages);
    _messageController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context: context,
        titleWidget: const ChatAppBarTitle(),
        actionWidgets: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up_outlined),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {
                  if(state is ChatSuccess) {
                    messages.add(state.message);
                  }

                  if (state is ChatFailure) {
                    context.showSnackBar(
                      message: state.errorMessage,
                      type: SnackBarType.error,
                      secondsDuration: 6
                    );
                    // Mark the last message as failed
                    messages[messages.length - 1] =
                        messages.last.copyWith(status: MessageStatus.failed);
                  }
                },
                builder: (context, state) {
                  if (state is ChatInitial) {
                    return SuggestionsContent(
                      onSuggestionTap: _sendMessage
                    );
                  }

                  return MessagesList(
                    scrollController: _scrollController,
                    messages: messages,
                    showTypingIndicator: state is ChatLoading,
                  );
                },
                buildWhen: (previous, current) =>
                current is ChatLoading || current is ChatSuccess ||
                    current is ChatFailure,
              ),
            ),

            BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  return ChatInputField(
                    controller: _messageController,
                    messages: messages,
                    isEnabled: state is! ChatLoading,
                    onMessageSent: () {
                      final text = _messageController.text;
                      _sendMessage(text);
                    },
                  );
                },
              buildWhen: (previous, current) =>
                  current is ChatLoading ||
                  current is ChatSuccess ||
                  current is ChatFailure,
            ),
          ],
        ),
      ),
    );
  }
}


