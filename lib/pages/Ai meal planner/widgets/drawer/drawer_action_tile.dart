import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerActionTile extends HookConsumerWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final IconData? trailingIcon;
  final bool isSelected;

  const DrawerActionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailingIcon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final accentColor = theme.primaryColor;
    final isHovered = useState(false);

    return FocusableActionDetector(
      onShowHoverHighlight: (value) {
        isHovered.value = value;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? accentColor.withOpacity(0.15)
              : isHovered.value
                  ? const Color(0xFF2A2A2A)
                  : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? accentColor.withOpacity(0.4)
                : Colors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            splashColor: accentColor.withOpacity(0.1),
            highlightColor: accentColor.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: isSelected ? accentColor : Colors.white70,
                    size: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white.withOpacity(0.9),
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                  ),
                  if (trailingIcon != null)
                    Icon(
                      trailingIcon,
                      color: Colors.white.withOpacity(0.4),
                      size: 16,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

