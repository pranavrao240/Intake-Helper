import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecentChatTile extends HookConsumerWidget {
  final String title;
  final String? time;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onShare;

  const RecentChatTile({
    super.key,
    required this.title,
    this.time,
    required this.onTap,
    this.isSelected = false,
    this.onDelete,
    this.onShare,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final accentColor = theme.primaryColor;
    final isHovered = useState(false);
    final menuKey =
        useMemoized(() => GlobalKey<PopupMenuButtonState<String>>());

    return FocusableActionDetector(
      onShowHoverHighlight: (value) {
        isHovered.value = value;
      },
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: PopupMenuButton<String>(
              key: menuKey,
              enabled: true,
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
              color: const Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.white.withOpacity(0.08)),
              ),
              itemBuilder: (context) => [
                const PopupMenuItem<String>(
                  value: 'share',
                  child: Row(
                    children: [
                      Icon(Icons.share_outlined,
                          color: Colors.white70, size: 18),
                      SizedBox(width: 12),
                      Text('Share', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                const PopupMenuDivider(height: 1),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline_rounded,
                          color: Color(0xFFEF4444), size: 18),
                      SizedBox(width: 12),
                      Text('Delete',
                          style: TextStyle(
                              color: Color(0xFFEF4444),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'delete') {
                  if (onDelete != null) {
                    onDelete!();
                  }
                } else if (value == 'share') {
                  if (onShare != null) {
                    onShare!();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('${value.toUpperCase()} tapped for "$title"')),
                  );
                }
              },
              child: const SizedBox.shrink(),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withOpacity(0.08)
                  : isHovered.value
                      ? const Color(0xFF2A2A2A)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                onLongPress: () {
                  menuKey.currentState?.showButtonMenu();
                },
                borderRadius: BorderRadius.circular(10),
                splashColor: accentColor.withOpacity(0.08),
                highlightColor: accentColor.withOpacity(0.04),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                        size: 16,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.8),
                                fontSize: 13.5,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                              ),
                            ),
                            if (time != null) ...[
                              const SizedBox(height: 2),
                              Text(
                                time!,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
