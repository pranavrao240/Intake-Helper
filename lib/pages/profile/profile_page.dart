import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intake_helper/pages/profile/widgets/achievements_widget.dart';
import 'package:intake_helper/pages/profile/widgets/settings_widget.dart';
import 'widgets/profile_header.dart';
import 'widgets/physical_stats_card.dart';
import 'package:intake_helper/components/bottom_navbar.dart';
import 'widgets/logout_button.dart';
import 'widgets/avatar_modal.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAvatar = useState('💪');
    final isModalOpen = useState(false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(
                  selectedAvatar: selectedAvatar.value,
                  onEditAvatar: () => isModalOpen.value = true,
                ),
                const SizedBox(height: 24),
                const PhysicalStatsCard(),
                const SizedBox(height: 24),
                AchievementsWidget(),
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
              currentAvatar: selectedAvatar.value,
              onClose: () => isModalOpen.value = false,
              onSelect: (avatar) {
                selectedAvatar.value = avatar;
                isModalOpen.value = false;
              },
            ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
      resizeToAvoidBottomInset: false,
    );
  }
}
