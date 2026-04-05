import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

String? _extractImageUrl(String text) {
  final match = RegExp(r'!\\[.*?\\]\\((.*?)\\)').firstMatch(text);
  return match?.group(1);
}

String _cleanText(String text) {
  return text
      .replaceAll(
        RegExp(
          r'Meal Image only one image should be given:\\s*\\n?',
          caseSensitive: false,
        ),
        '',
      )
      .replaceAll(RegExp(r'!\\[.*?\\]\\(.*?\\)'), '')
      .replaceAll(RegExp(r'\\n{3,}'), '\n\n')
      .trim();
}

class _MealSection {
  final String label;
  final String value;
  const _MealSection(this.label, this.value);
}

List<_MealSection> _parseSections(BuildContext context, String text) {
  final sections = <_MealSection>[];
  final lines = text.split('\n');
  final locale = AppLocalizations.of(context)!;

  String currentLabel = '';
  final buffer = StringBuffer();

  final sectionHeaders = {
    '${locale.aiBubbleMealName}:',
    '${locale.aiBubbleMealType}:',
    '${locale.aiBubbleQuantity}:',
    '${locale.aiBubbleSteps}:',
    '${locale.aiBubbleNutrition}:',
  };

  void flush() {
    if (currentLabel.isNotEmpty && buffer.isNotEmpty) {
      sections.add(_MealSection(currentLabel, buffer.toString().trim()));
    }
  }

  for (final raw in lines) {
    final line = raw.trim();
    if (line.isEmpty) continue;

    final header = sectionHeaders.cast<String?>().firstWhere(
          (h) => line.startsWith(h!),
          orElse: () => null,
        );

    if (header != null) {
      flush();
      currentLabel = header.replaceAll(':', '');
      buffer.clear();
      final inline = line.replaceFirst(header, '').trim();
      if (inline.isNotEmpty) buffer.write(inline);
    } else {
      if (buffer.isNotEmpty) buffer.write('\n');
      buffer.write(line);
    }
  }
  flush();
  return sections;
}

Widget aiBubble(
  String text,
  BuildContext context, {
  required void Function(String) onSave,
}) {
  final imageUrl = _extractImageUrl(text);
  final cleaned = _cleanText(text);
  final locale = AppLocalizations.of(context)!;
  final isMealPlan = cleaned.contains('${locale.aiBubbleMealName}:');
  final sections =
      isMealPlan ? _parseSections(context, cleaned) : <_MealSection>[];

  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.82,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.07)),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl != null)
                Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      height: 180,
                      color: const Color(0xFF222222),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF00E599),
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },
                ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: isMealPlan && sections.isNotEmpty
                    ? _FormattedMeal(sections: sections)
                    : Text(
                        cleaned,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            _ActionIcon(
              icon: Icons.copy,
              onTap: () {
                Clipboard.setData(ClipboardData(text: cleaned));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(locale.aiBubbleCopiedToClipboard)),
                );
              },
            ),
            _ActionIcon(
              icon: Icons.thumb_up_alt_outlined,
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(locale.aiBubbleThanksForFeedback)),
              ),
            ),
            _ActionIcon(
              icon: Icons.thumb_down_alt_outlined,
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(locale.aiBubbleThanksForFeedback)),
              ),
            ),
            _ActionIcon(
              icon: Icons.bookmark_border,
              color: const Color(0xFF00E599),
              onTap: () => onSave(text),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    ),
  );
}

class _FormattedMeal extends StatelessWidget {
  final List<_MealSection> sections;
  const _FormattedMeal({required this.sections});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.map((s) => _sectionWidget(context, s)).toList(),
    );
  }

  Widget _sectionWidget(BuildContext context, _MealSection s) {
    final locale = AppLocalizations.of(context)!;
    switch (s.label) {
      case 'Meal Name':
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            s.value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.3,
            ),
          ),
        );

      case 'Meal Type':
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF00E599).withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: const Color(0xFF00E599).withOpacity(0.3)),
            ),
            child: Text(
              s.value,
              style: const TextStyle(
                color: Color(0xFF00E599),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );

      case 'Quantity':
        return _labeledBlock(
          icon: Icons.restaurant_menu,
          label: locale.aiBubbleQuantity,
          content: s.value,
        );

      case 'Steps':
        return _labeledBlock(
          icon: Icons.format_list_numbered,
          label: locale.aiBubbleSteps,
          content: s.value,
        );

      case 'Nutrition':
        return _nutritionBlock(context, s.value);

      default:
        return Text(
          s.value,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        );
    }
  }

  Widget _labeledBlock({
    required IconData icon,
    required String label,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 13, color: const Color(0xFF00E599)),
              const SizedBox(width: 5),
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF00E599),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 13,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }

  Widget _nutritionBlock(BuildContext context, String content) {
    final nutrients = <String, String>{};
    final locale = AppLocalizations.of(context)!;
    for (final line in content.split('\n')) {
      final parts = line.split(':');
      if (parts.length >= 2) {
        nutrients[parts[0].trim()] = parts.sublist(1).join(':').trim();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.bar_chart, size: 13, color: Color(0xFF00E599)),
            const SizedBox(width: 5),
            Text(
              locale.aiBubbleNutritionCaps,
              style: const TextStyle(
                color: Color(0xFF00E599),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: nutrients.entries
              .map(
                (e) => Expanded(
                  child: _NutrientChip(e.key, e.value),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _NutrientChip extends StatelessWidget {
  final String label;
  final String value;
  const _NutrientChip(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.45),
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF00E599),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const _ActionIcon({
    required this.icon,
    required this.onTap,
    this.color = Colors.white54,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 18),
      color: color,
      onPressed: onTap,
    );
  }
}
