import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/components/custom_textfield.dart';
import 'package:intake_helper/pages/Login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Form key (kept as in your original)
    final GlobalKey<FormState> globalKey =
        useMemoized(() => GlobalKey<FormState>());

    // Local states using hooks (replaces setState)
    final isAsyncCallProcess = useState<bool>(false);
    final fullName = useState<String?>(null);
    final email = useState<String?>(null);
    final password = useState<String?>(null);

    final hidePassword = useState<bool>(true); // for confirm password field
    final textPwd = useState<String>("");
    final fullNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final hideConfirmPassword = useState(false);
    final message = useState<String?>('');
    final registerState = ref.watch(apiServiceProvider);
    final registerNotifier = ref.read(apiServiceProvider.notifier);

    // Helper: validateSave (keeps same behavior)
    Future<bool> validateSave() async {
      final form = globalKey.currentState;
      if (form == null) {
        if (kDebugMode) print('FormState is null');
        return false;
      }
      if (form.validate()) {
        form.save();
        return true;
      } else {
        return false;
      }
    }

    // Main UI
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 177, 109),
        body: ModalProgressHUD(
          inAsyncCall: isAsyncCallProcess.value,
          opacity: .3,
          key: UniqueKey(),
          child: Form(
            key: globalKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 18),

                    // Top header: small icon + App title (centered)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/assets/images/intake_helper_logo.png",
                          width: 58,
                          height: 58,
                        ),
                        const Text(
                          "Intake Helper",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Center card
                    Center(
                      child: Container(
                        width: screenWidth > 420 ? 420 : double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F0F10),
                          borderRadius: BorderRadius.circular(18),
                          border:
                              Border.all(color: Colors.grey.shade800, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(0, 8),
                              blurRadius: 28,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.01),
                              offset: const Offset(0, -2),
                              blurRadius: 6,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Start your fitness transformation today",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 13.5,
                              ),
                            ),
                            const SizedBox(height: 18),

                            // Full Name
                            CommonInputField(
                              label: "Full Name",
                              prefixIcon: Icons.person,
                              controller: fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            // Email
                            CommonInputField(
                              label: "E-mail",
                              prefixIcon: Icons.email,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!value.contains(RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            // Password
                            CommonInputField(
                              label: "Password",
                              prefixIcon: Icons.lock,
                              controller: passwordController,
                              obscureText: hidePassword.value,
                              showVisibilityToggle: true,
                              onToggleVisibility: () {
                                hidePassword.value = !hidePassword.value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            // Confirm Password
                            CommonInputField(
                              label: "Confirm Password",
                              prefixIcon: Icons.lock,
                              controller: confirmPasswordController,
                              obscureText: hideConfirmPassword.value,
                              showVisibilityToggle: true,
                              onToggleVisibility: () {
                                hideConfirmPassword.value =
                                    !hideConfirmPassword.value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            // small helper text
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 6.0, top: 8.0),
                              child: Text(
                                textPwd.value,
                                style:
                                    const TextStyle(color: Color(0xFF6AF243)),
                              ),
                            ),

                            const SizedBox(height: 18),

                            // CTA button
                            SizedBox(
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () async {
                                  if (await validateSave()) {
                                    // API integration
                                    isAsyncCallProcess.value = true;
                                    try {
                                      final response = await ref
                                          .read(apiServiceProvider.notifier)
                                          .registerUser(
                                            fullNameController.text,
                                            emailController.text,
                                            passwordController.text,
                                          );

                                      print(
                                          'register api fetched - > ${response}');

                                      isAsyncCallProcess.value = false;

                                      FormHelper.showSimpleAlertDialog(
                                          context,
                                          Config.appName,
                                          registerState.message ??
                                              'Registration Successfull!',
                                          "OK", () {
                                        Navigator.of(context).pop();
                                      });
                                    } catch (e) {
                                      print('Error in reg page - $e');
                                      isAsyncCallProcess.value = false;
                                      FormHelper.showSimpleAlertDialog(
                                          context,
                                          Config.appName,
                                          "Error occurred",
                                          "OK", () {
                                        Navigator.of(context).pop();
                                      });
                                    }
                                  } else {
                                    FormHelper.showSimpleAlertDialog(
                                        context,
                                        Config.appName,
                                        "Please fill all the fields",
                                        "OK", () {
                                      Navigator.of(context).pop();
                                    });
                                  }
                                },
                                child: Container(
                                  height: 52,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.greenAccent,
                                        Colors.green
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.45),
                                        offset: const Offset(0, 8),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Start Your Journey',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 14),

                            // Sign in row
                            Center(
                              child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 14),
                                      children: <TextSpan>[
                                    const TextSpan(
                                        text: "Already have an account? "),
                                    TextSpan(
                                        text: "Sign In",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));
                                          },
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold))
                                  ])),
                            ),

                            const SizedBox(height: 12),

                            // Terms small text
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.0),
                                child: Text(
                                  "By signing up, you agree to our Terms of Service and Privacy Policy",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF6E6E6E), fontSize: 11.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
