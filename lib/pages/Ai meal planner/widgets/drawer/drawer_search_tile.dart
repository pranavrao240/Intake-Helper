import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerSearchTile extends HookConsumerWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const DrawerSearchTile({
    super.key,
    required this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFocused = useState(false);
    final textController = useTextEditingController();
    final focusNode = useFocusNode();

    // Rebuild when text changes to toggle the clear icon correctly
    useListenable(textController);

    useEffect(() {
      void focusListener() {
        isFocused.value = focusNode.hasFocus;
      }
      focusNode.addListener(focusListener);
      return () => focusNode.removeListener(focusListener);
    }, [focusNode]);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isFocused.value
              ? Theme.of(context).primaryColor.withOpacity(0.5)
              : Colors.white.withOpacity(0.05),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: isFocused.value
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.4),
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: textController,
                focusNode: focusNode,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Search Chats',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  filled: false,
                ),
                onChanged: onChanged,
              ),
            ),
            if (textController.text.isNotEmpty)
              GestureDetector(
                onTap: () {
                  textController.clear();
                  onChanged('');
                  if (onClear != null) {
                    onClear!();
                  }
                },
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white.withOpacity(0.4),
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}


