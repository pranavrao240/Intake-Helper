import 'package:flutter/material.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  const SocialLoginButtons({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Divider(color: Colors.white.withValues(alpha: 0.08))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                locale.socialLoginOrContinueWith,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.2),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Expanded(
                child: Divider(color: Colors.white.withValues(alpha: 0.08))),
          ],
        ),
        const SizedBox(height: 16),
        // Buttons row
        Row(
          children: [
            Expanded(
              child: _SocialButton(
                label: locale.socialLoginGoogle,
                icon: _GoogleIcon(),
                onTap: onGoogleTap,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                label: locale.socialLoginApple,
                icon: const Icon(Icons.apple, color: Colors.white, size: 20),
                onTap: onAppleTap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback? onTap;

  const _SocialButton({
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: CustomPaint(painter: _GooglePainter()),
    );
  }
}

class _GooglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw colored arcs for Google G
    final paintRed = Paint()..color = const Color(0xFFEA4335);
    final paintBlue = Paint()..color = const Color(0xFF4285F4);
    final paintGreen = Paint()..color = const Color(0xFF34A853);
    final paintYellow = Paint()..color = const Color(0xFFFBBC05);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -1.0,
        1.6,
        false,
        paintRed
          ..strokeWidth = 3.5
          ..style = PaintingStyle.stroke);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        0.6,
        1.6,
        false,
        paintYellow
          ..strokeWidth = 3.5
          ..style = PaintingStyle.stroke);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        2.2,
        1.6,
        false,
        paintGreen
          ..strokeWidth = 3.5
          ..style = PaintingStyle.stroke);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        3.8,
        1.1,
        false,
        paintBlue
          ..strokeWidth = 3.5
          ..style = PaintingStyle.stroke);

    // Horizontal bar for G
    final barPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(center.dx, center.dy),
      Offset(center.dx + radius, center.dy),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
