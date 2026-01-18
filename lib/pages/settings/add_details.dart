import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDetails extends HookConsumerWidget {
  const AddDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(apiServiceProvider);
    final profile = userState.value?.profileData;
    // Controllers using hooks
    final ageController = useTextEditingController();
    final weightController = useTextEditingController();
    final heightController = useTextEditingController();
    final dobController = useTextEditingController();

    // Load saved data once when widget is built
    useEffect(() {
      Future.microtask(() async {
        ageController.text =
            profile?.age != null ? profile!.age.toString() : '';
        weightController.text =
            profile?.weight != null ? profile!.weight.toString() : '';
        heightController.text =
            profile?.height != null ? profile!.height.toString() : '';
        dobController.text = profile?.dateOfBirth ?? '';
      });

      return null;
    }, []);

    // Date picker
    Future<void> pickDate(BuildContext context) async {
      final picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Color(0xFF00FFAA),
                onPrimary: Colors.black,
                surface: Color(0xFF1A1A1A),
                onSurface: Colors.white,
              ),
            ),
            child: child!,
          );
        },
      );

      if (picked != null) {
        dobController.text = "${picked.day.toString().padLeft(2, '0')}/"
            "${picked.month.toString().padLeft(2, '0')}/"
            "${picked.year}";
      }
    }

    // Widgets for text fields
    Widget darkTextField(
        TextEditingController controller, String label, IconData icon) {
      return Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white70),
            prefixIcon: Icon(icon, color: const Color(0xFF00FFAA)),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
    }

    Widget darkDateField(BuildContext context, TextEditingController controller,
        String label, IconData icon) {
      return GestureDetector(
        onTap: () => pickDate(context),
        child: AbsorbPointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(color: Colors.white70),
                prefixIcon: Icon(icon, color: const Color(0xFF00FFAA)),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Listen to API provider
    ref.listen(apiServiceProvider, (previous, next) {
      if (next.isLoading) {
        // show loading indicator if needed
      }
    });

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A1A),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Add Details",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            darkTextField(ageController, "Enter your Age", Icons.cake),
            const SizedBox(height: 16),
            darkTextField(weightController, "Enter your Weight (kg)",
                Icons.monitor_weight),
            const SizedBox(height: 16),
            darkTextField(
                heightController, "Enter your Height (cm)", Icons.height),
            const SizedBox(height: 16),
            darkDateField(context, dobController, "Select Date of Birth",
                Icons.calendar_today),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00FFAA),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () async {
                  // Safe parsing
                  int? age;
                  double? weight;
                  double? height;

                  if (ageController.text.trim().isNotEmpty) {
                    age = int.tryParse(ageController.text.trim());
                  }

                  if (weightController.text.trim().isNotEmpty) {
                    weight = double.tryParse(weightController.text.trim());
                  }

                  if (heightController.text.trim().isNotEmpty) {
                    height = double.tryParse(heightController.text.trim());
                  }

                  final dateOfBirth = dobController.text.trim().isNotEmpty
                      ? dobController.text.trim()
                      : null;

                  await ref
                      .read(apiServiceProvider.notifier)
                      .updateProfile(
                        age: age,
                        weight: weight,
                        height: height,
                        dateOfBirth: dateOfBirth,
                      )
                      .then((value) async {
                    final preferences = await SharedPreferences.getInstance();
                    final token = preferences.getString('token');
                    await ref
                        .read(apiServiceProvider.notifier)
                        .getProfile(token!);

                    if (context.mounted) {
                      context.pushReplacement(RouteConstants.settings.path);
                    }
                  });
                },
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
