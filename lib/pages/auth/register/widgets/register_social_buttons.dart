import 'package:flutter/material.dart';
import 'package:intake_helper/l10n/app_localizations.dart';

class RegisterSocialButtons extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  const RegisterSocialButtons({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      children: [
        // Divider
        Row(
          children: [
            Expanded(
                child: Divider(color: Colors.white.withValues(alpha: 0.08))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                locale.registerSocialOrContinueWith,
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
        Row(
          children: [
            Expanded(
              child: _SocialBtn(
                label: locale.registerSocialGoogle,
                icon: _GoogleIcon(),
                onTap: onGoogleTap,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialBtn(
                label: locale.registerSocialApple,
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

class _SocialBtn extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback? onTap;

  const _SocialBtn({required this.label, required this.icon, this.onTap});

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
            Text(label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SizedBox(width: 20, height: 20, child: CustomPaint(painter: _GPainter()));
}

class _GPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;
    final w = 3.5;

    void arc(double start, double sweep, Color color) {
      canvas.drawArc(
        Rect.fromCircle(center: c, radius: r),
        start,
        sweep,
        false,
        Paint()
          ..color = color
          ..strokeWidth = w
          ..style = PaintingStyle.stroke,
      );
    }

    arc(-1.0, 1.6, const Color(0xFFEA4335));
    arc(0.6, 1.6, const Color(0xFFFBBC05));
    arc(2.2, 1.6, const Color(0xFF34A853));
    arc(3.8, 1.1, const Color(0xFF4285F4));

    canvas.drawLine(
      Offset(c.dx, c.dy),
      Offset(c.dx + r, c.dy),
      Paint()
        ..color = const Color(0xFF4285F4)
        ..strokeWidth = w
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
