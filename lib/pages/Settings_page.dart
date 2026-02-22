import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/pages/settings/add_details.dart';
import 'package:intake_helper/widgets/top_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  static const String _themeKey = 'theme_mode';

  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    final themeIndex = pref.getInt(_themeKey) ?? ThemeMode.system.index;
    state = ThemeMode.values[themeIndex];
  }

  Future<void> setTheme(ThemeMode theme) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt(_themeKey, theme.index);
    state = theme;
  }
}

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        final pref = await SharedPreferences.getInstance();
        final token = pref.getString('token');
        if (token != null) {
          await ref.read(apiServiceProvider.notifier).getProfile(token);
        }
      });
      return null;
    }, []);

    final userState = ref.watch(apiServiceProvider);

    final weight = useState(
      userState.value?.profileData?.weight != null
          ? "${userState.value!.profileData!.weight} "
          : '',
    );

    final height = useState(
      userState.value?.profileData?.height != null
          ? "${userState.value!.profileData!.height} "
          : '',
    );

    final dob = useState(
      userState.value?.profileData?.dateOfBirth ?? '',
    );

    final age = useState(
      userState.value?.profileData?.age?.toString() ?? '',
    );

    final userName = userState.maybeWhen(
      data: (d) => d.profileData?.fullName ?? 'Guest',
      orElse: () => 'Guest',
    );

    final email = userState.maybeWhen(
      data: (d) => d.profileData?.email ?? 'Guest',
      orElse: () => 'Guest',
    );

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: customAppbar(context, title: "Settings"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('lib/assets/images/baki.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Intake Helper',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _darkInfoCard(Icons.person, "Name", userName),
            _darkInfoCard(Icons.email, "Email", email),
            GestureDetector(
              onTap: () => _showAddDetails(context),
              child: _darkInfoCard(
                Icons.edit,
                "Add Details",
                "Tap to update your info",
              ),
            ),
            const SizedBox(height: 20),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              children: [
                _darkStatCard(Icons.cake, "Age", age.value),
                _darkStatCard(Icons.monitor_weight, "Weight",
                    weight.value.isEmpty ? '' : "${weight.value} kg"),
                _darkStatCard(Icons.height, "Height",
                    height.value.isEmpty ? '' : "${height.value} cm"),
                _darkStatCard(Icons.calendar_today, "DOB", dob.value),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00FFAA),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.clear();
                context.go('/login');
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddDetails(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF1A1A1A),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const AddDetails(),
  );
}

Widget _darkInfoCard(IconData icon, String title, String value) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: _darkCardDecoration(),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFF00FFAA)),
      title: Text(title, style: const TextStyle(color: Colors.white70)),
      subtitle: Text(
        value,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _darkStatCard(IconData icon, String title, String value) {
  return Container(
    decoration: _darkCardDecoration(),
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: const Color(0xFF00FFAA), size: 30),
        const SizedBox(height: 12),
        Text(title,
            style: const TextStyle(color: Colors.white70, fontSize: 13)),
        const SizedBox(height: 6),
        Text(
          value.isEmpty ? "Not set" : value,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

BoxDecoration _darkCardDecoration() {
  return BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(14),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 6,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
