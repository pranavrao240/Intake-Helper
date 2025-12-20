import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Config/Config.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/pages/register_page.dart';
import 'package:intake_helper/components/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> globalKey =
        useMemoized(() => GlobalKey<FormState>());

    final isAsyncCallProcess = useState<bool>(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final hidePassword = useState<bool>(true);
    final email = useState<String?>(null);
    final password = useState<String?>(null);

    Future<bool> validateSave() async {
      final form = globalKey.currentState;
      if (form == null) {
        if (kDebugMode) print('FormState is null');
        return false;
      }
      if (form.validate()) {
        form.save();
        return true;
      }
      return false;
    }

    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 177, 109),
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
          ),
          child: ModalProgressHUD(
            inAsyncCall: isAsyncCallProcess.value,
            opacity: 0.3,
            key: UniqueKey(),
            child: Form(
              key: globalKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 28),
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
                      // Center Card
                      Center(
                        child: Container(
                          width: screenWidth > 420 ? 420 : double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0F0F10),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                                color: Colors.grey.shade800, width: 1),
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
                                "Welcome Back",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "Login to continue your fitness journey",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13.5,
                                ),
                              ),
                              const SizedBox(height: 18),

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
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 18),

                              // Login button
                              SizedBox(
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (await validateSave()) {
                                      isAsyncCallProcess.value = true;
                                      try {
                                        final response = await ref
                                            .read(apiServiceProvider.notifier)
                                            .loginUser(
                                              emailController.text.trim(),
                                              passwordController.text.trim(),
                                            );
                                        isAsyncCallProcess.value = false;

                                        if (response) {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.setString("user_email",
                                              emailController.text.trim());

                                          FormHelper.showSimpleAlertDialog(
                                              context,
                                              Config.appName,
                                              "Logged in Successfully",
                                              "OK", () {
                                            context.go("/home");
                                          });
                                        } else {
                                          FormHelper.showSimpleAlertDialog(
                                              context,
                                              Config.appName,
                                              "Invalid email/password",
                                              "OK", () {
                                            context.pop();
                                          });
                                        }
                                      } catch (e) {
                                        isAsyncCallProcess.value = false;
                                        FormHelper.showSimpleAlertDialog(
                                            context,
                                            Config.appName,
                                            "Error occurred",
                                            "OK", () {
                                          context.pop();
                                        });
                                      }
                                    } else {
                                      FormHelper.showSimpleAlertDialog(
                                          context,
                                          Config.appName,
                                          "Please fill all the fields",
                                          "OK", () {
                                        context.pop();
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
                                        'Log In',
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

                              // Sign up row
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: Colors.white70, fontSize: 14),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: "Don't have an account? "),
                                      TextSpan(
                                        text: "Sign Up",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RegisterPage()));
                                          },
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
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
      ),
    );
  }
}
