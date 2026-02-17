import "package:flutter/material.dart";
import "../../../../core/app_widgets/app_text.dart";
import "../../../../core/extensions/sized_box_extension.dart";

class SuggestionsContent extends StatelessWidget {
  final ValueChanged<String> onSuggestionTap;

  const SuggestionsContent({super.key, required this.onSuggestionTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Section(
            icon: Icons.handshake_outlined,
            title: "Self-introduction",
            items: const [
              "Hello, I am Mohammed Abdeen",
            ],
            onTap: onSuggestionTap,
          ),
          24.heightSpace(),

          Section(
            icon: Icons.menu_book_outlined,
            title: "Explain",
            items: const [
              "Explain how async and await work in Dart",
              "What is the difference between final and const in Dart?",
            ],
            onTap: onSuggestionTap,
          ),
          24.heightSpace(),

          Section(
            icon: Icons.edit_outlined,
            title: "Write & edit",
            items: const [
              "Write a professional Flutter developer bio",
              "Write a clean Dart extension for DateTime formatting",
              "Write a professional email to a company introducing myself, explaining my purpose."
            ],
            onTap: onSuggestionTap,
          ),
          24.heightSpace(),

          Section(
            icon: Icons.translate_outlined,
            title: "Translate",
            items: const [
              "How do you say \"how are you\" in Arabic?",
              "Translate this sentence into English: \"Bonjour, comment ça va ?\"",
            ],
            onTap: onSuggestionTap,
          ),
        ],
      ),
    );
  }
}

/// =======================================================
/// ================== SECTION WIDGET =====================
/// =======================================================

class Section extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;
  final ValueChanged<String> onTap;

  const Section({
    super.key,
    required this.icon,
    required this.title,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.black54),
        AppText(
          text: title,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: theme.textTheme.bodyLarge?.color,
        ),

        16.heightSpace(),

        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SuggestionTile(text: item, onTap: () => onTap(item)),
          ),
        ),
      ],
    );
  }
}

/// =======================================================
/// ================== TILE WIDGET ========================
/// =======================================================

class SuggestionTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SuggestionTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: AppText(
          text: text,
          fontSize: 15,
          textAlign: TextAlign.center,
          color: theme.textTheme.bodyLarge?.color,
          horizontalPadding: 16,
          verticalPadding: 10,
        ),
      ),
    );
  }
}
