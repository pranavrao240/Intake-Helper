import 'package:flutter/material.dart';

enum ConfirmFieldState { idle, match, mismatch }

class RegisterInputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool showVisibilityToggle;
  final VoidCallback? onToggleVisibility;
  final String? Function(String?)? validator;

  final ConfirmFieldState confirmState;

  const RegisterInputField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.prefixIcon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.showVisibilityToggle = false,
    this.onToggleVisibility,
    this.validator,
    this.confirmState = ConfirmFieldState.idle,
  });

  Color get _borderColor {
    switch (confirmState) {
      case ConfirmFieldState.match:
        return const Color(0xFF22C55E).withValues(alpha: 0.7);
      case ConfirmFieldState.mismatch:
        return const Color(0xFFEF4444).withValues(alpha: 0.7);
      case ConfirmFieldState.idle:
        return Colors.white.withValues(alpha: 0.1);
    }
  }

  Color get _focusedBorderColor {
    switch (confirmState) {
      case ConfirmFieldState.match:
        return const Color(0xFF22C55E);
      case ConfirmFieldState.mismatch:
        return const Color(0xFFEF4444);
      case ConfirmFieldState.idle:
        return const Color(0xFFEF4444);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
                color: Colors.white.withValues(alpha: 0.2), fontSize: 14),
            prefixIcon: Icon(prefixIcon, color: Colors.white30, size: 18),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Green checkmark for confirmed match
                if (confirmState == ConfirmFieldState.match)
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Text(
                      '✓',
                      style: TextStyle(
                        color: Color(0xFF22C55E),
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                if (showVisibilityToggle)
                  IconButton(
                    icon: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white30,
                      size: 18,
                    ),
                    onPressed: onToggleVisibility,
                  ),
              ],
            ),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.05),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: _borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: _borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: _focusedBorderColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFEF4444)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: Color(0xFFEF4444), width: 1.5),
            ),
            errorStyle: const TextStyle(color: Color(0xFFEF4444), fontSize: 11),
          ),
        ),
      ],
    );
  }
}
