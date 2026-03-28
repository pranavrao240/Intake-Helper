import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String imagePath = 'lib/assets/characters';
const Map<String, String> _avatarList = {
  'male1': '$imagePath/male1.png',
  'male2': '$imagePath/male2.png',
  'male3': '$imagePath/male3.png',
  'male4': '$imagePath/male4.png',
  'female1': '$imagePath/female1.png',
  'female2': '$imagePath/female2.png',
  'female3': '$imagePath/female3.png',
  'female4': '$imagePath/female4.png',
};

class AvatarModal extends HookConsumerWidget {
  final String currentAvatar;
  final VoidCallback onClose;
  final ValueChanged<String> onSelect;

  const AvatarModal({
    super.key,
    required this.currentAvatar,
    required this.onClose,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempAvatar = useState(currentAvatar);

    void setSelectedAvatar(String avatar) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('avatar', avatar);
    }

    return GestureDetector(
      onTap: onClose,
      child: Container(
        color: Colors.black.withValues(alpha: 0.7),
        child: Center(
          child: GestureDetector(
            onTap: () {}, // prevent close on inner tap
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF18181B),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: const Color(0xFF27272A)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Header ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Choose Avatar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: onClose,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFF27272A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.close_rounded,
                              color: Color(0xFF71717A), size: 18),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ── Avatar grid ──
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: _avatarList.values.map((avatar) {
                      final isSelected = tempAvatar.value == avatar;

                      return GestureDetector(
                        onTap: () {
                          tempAvatar.value = avatar;

                          setSelectedAvatar(tempAvatar.value
                              .split('/')
                              .last
                              .split('.')
                              .first);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(
                                    color: const Color(0xFF6D28D9), width: 3)
                                : null,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              avatar,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                              alignment: Alignment.topLeft,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // ── Update button ──
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => onSelect(tempAvatar.value),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6D28D9),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
