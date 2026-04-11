import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/pages/profile/widgets/achievements_widget.dart';
import 'package:intake_helper/pages/profile/widgets/settings_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/profile_header.dart';
import 'widgets/physical_stats_card.dart';
import 'package:intake_helper/components/bottom_navbar.dart';
import 'widgets/logout_button.dart';
import 'widgets/avatar_modal.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(apiServiceProvider);
    final profileImage = profileState.value?.profileData?.profileImage;

    final selectedAvatar = useState<String?>(null);
    final safeAvatar =
        selectedAvatar.value ?? profileImage ?? 'assets/characters/male1.png';
    final isModalOpen = useState(false);

    Future<void> getProfile() async {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString('token');
      await ref.read(apiServiceProvider.notifier).getProfile(token ?? '');
    }

    useEffect(() {
      Future.microtask(() {
        getProfile();
      });
      return null;
    }, []);
    useEffect(() {
      if (profileImage != null && selectedAvatar.value == null) {
        selectedAvatar.value = profileImage;
      }
      return null;
    }, [profileImage]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(
                  selectedAvatar: safeAvatar,
                  onEditAvatar: () => isModalOpen.value = true,
                ),
                const SizedBox(height: 24),
                const PhysicalStatsCard(),
                const SizedBox(height: 24),
                // Todos-
                // AchievementsWidget(),
                // const buildWeeklyChart(),
                const SizedBox(height: 24),
                SettingsWidget(),
                const SizedBox(height: 24),
                const LogoutButton(),
                const SizedBox(height: 40),
              ],
            ),
          ),
          if (isModalOpen.value)
            AvatarModal(
              currentAvatar: safeAvatar, // ✅ no crash
              onClose: () => isModalOpen.value = false,
              onSelect: (avatar) async {
                selectedAvatar.value = avatar;
                isModalOpen.value = false;

                await ref
                    .read(apiServiceProvider.notifier)
                    .updateProfileImage(profileImage: avatar);
              },
            ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
      resizeToAvoidBottomInset: false,
    );
  }
}
