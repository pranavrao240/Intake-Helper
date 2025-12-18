import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  String weight = '';
  String height = '';
  String dob = '';
  String age = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      age = prefs.getString('age') ?? '';
      weight = prefs.getString('weight') ?? '';
      height = prefs.getString('height') ?? '';
      dob = prefs.getString('dob') ?? '';
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserDetails();
  }

  Future<void> _showAddDetailsSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const Adddetails(),
    );
    await _loadUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final userState = ref.watch(apiServiceProvider);
    final String userName = userState.register?.data.fullname ?? 'Guest';

    final currentThemeLabel = themeMode == ThemeMode.dark
        ? "Dark"
        : themeMode == ThemeMode.light
            ? "Light"
            : "System";

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('lib/assets/images/baki.jpg'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Intake Helper',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 30),
                _buildInfoCard(
                  icon: Icons.person,
                  title: "Name:",
                  value: userName,
                ),
                _buildInfoCard(
                  icon: Icons.email,
                  title: "Email Id:",
                  value: "$userName@example.com",
                ),
                GestureDetector(
                  onTap: () => _showAddDetailsSheet(context),
                  child: _buildInfoCard(
                    icon: Icons.edit,
                    title: "Add details",
                    value: "Click to add details",
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text("Select Theme:"),
                    trailing: Text(
                      currentThemeLabel,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (_) => const ThemeSelectorSheet(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.0,
                  ),
                  children: [
                    _buildSelfDetailCard(
                      icon: Icons.cake,
                      title: "Age:",
                      value: age.isEmpty ? "Not set" : age,
                    ),
                    _buildSelfDetailCard(
                      icon: Icons.monitor_weight,
                      title: "Weight:",
                      value: weight.isEmpty ? "Not set" : "$weight kg",
                    ),
                    _buildSelfDetailCard(
                      icon: Icons.height,
                      title: "Height:",
                      value: height.isEmpty ? "Not set" : "$height cm",
                    ),
                    _buildSelfDetailCard(
                      icon: Icons.calendar_today,
                      title: "Date of Birth:",
                      value: dob.isEmpty ? "Not set" : dob,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(
                    Icons.logout,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        subtitle:
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildSelfDetailCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.deepPurple),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ThemeSelectorSheet extends ConsumerWidget {
  const ThemeSelectorSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: ThemeMode.values.map((mode) {
          final label = mode == ThemeMode.light
              ? "Light"
              : mode == ThemeMode.dark
                  ? "Dark"
                  : "System";

          return RadioListTile<ThemeMode>(
            title: Text(label),
            value: mode,
            groupValue: themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                ref.read(themeModeProvider.notifier).state = value;
                Navigator.pop(context);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}

class Adddetails extends ConsumerStatefulWidget {
  const Adddetails({super.key});

  @override
  ConsumerState<Adddetails> createState() => _AdddetailsState();
}

class _AdddetailsState extends ConsumerState<Adddetails> {
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    _ageController.text = prefs.getString('age') ?? '';
    _weightController.text = prefs.getString('weight') ?? '';
    _heightController.text = prefs.getString('height') ?? '';
    _dobController.text = prefs.getString('dob') ?? '';
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('age', _ageController.text);
    await prefs.setString('weight', _weightController.text);
    await prefs.setString('height', _heightController.text);
    await prefs.setString('dob', _dobController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const Text(
              "Add Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(_ageController, "Enter your Age", Icons.cake),
            const SizedBox(height: 16),
            _buildTextField(_weightController, "Enter your Weight (kg)",
                Icons.monitor_weight),
            const SizedBox(height: 16),
            _buildTextField(
                _heightController, "Enter your Height (cm)", Icons.height),
            const SizedBox(height: 16),
            _buildTextField(
                _dobController, "Enter DOB (DD/MM/YYYY)", Icons.calendar_today),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await _saveData();
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _dobController.dispose();
    super.dispose();
  }
}
