import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/Providers/physical_stats_edit.dart';

const _kRed = Color(0xFF6D28D9);

class PhysicalStatsCard extends HookConsumerWidget {
  const PhysicalStatsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(physicalStatsProvider);

    void openEdit() {
      showDialog(
        context: context,
        barrierColor: Colors.black.withValues(alpha: 0.75),
        builder: (_) => const PhysicalStatsEditModal(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF1E1E1E)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 16, 14),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: _kRed.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Icon(
                      Icons.monitor_weight_outlined,
                      color: _kRed,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Physical Stats',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: openEdit,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _kRed.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _kRed.withValues(alpha: 0.35),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit_rounded, color: _kRed, size: 12),
                          SizedBox(width: 5),
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: _kRed,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFF1E1E1E)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: stats.height == null &&
                      stats.weight == null &&
                      stats.age == null
                  ? _EmptyState(onTap: openEdit)
                  : Column(
                      children: [
                        Row(
                          children: [
                            _StatTile(
                              label: 'Height',
                              value: stats.height != null
                                  ? stats.height!.toStringAsFixed(0)
                                  : '—',
                              unit: 'cm',
                              icon: Icons.height_rounded,
                            ),
                            const SizedBox(width: 10),
                            _StatTile(
                              label: 'Weight',
                              value: stats.weight != null
                                  ? stats.weight!.toStringAsFixed(1)
                                  : '—',
                              unit: 'kg',
                              icon: Icons.fitness_center_rounded,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _StatTile(
                              label: 'Age',
                              value: stats.age != null
                                  ? stats.age.toString()
                                  : '—',
                              unit: 'yrs',
                              icon: Icons.cake_outlined,
                            ),
                            const SizedBox(width: 10),
                            _StatTile(
                              label: 'Body Fat',
                              value: stats.bodyFat != null
                                  ? stats.bodyFat!.toStringAsFixed(1)
                                  : '—',
                              unit: '%',
                              icon: Icons.percent_rounded,
                            ),
                          ],
                        ),
                        if (stats.gender != null) ...[
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1A1A),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.wc_rounded,
                                    color: Color(0xFF888888), size: 15),
                                const SizedBox(width: 8),
                                const Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: Color(0xFF888888), fontSize: 12),
                                ),
                                const Spacer(),
                                Text(
                                  stats.gender!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;

  const _StatTile({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF888888), size: 13),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF888888),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                const SizedBox(width: 3),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    unit,
                    style: const TextStyle(
                      color: _kRed,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onTap;

  const _EmptyState({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Column(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _kRed.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(color: _kRed.withValues(alpha: 0.25)),
              ),
              child: const Icon(Icons.add_rounded, color: _kRed, size: 22),
            ),
            const SizedBox(height: 12),
            const Text(
              'Add your stats',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Tap to enter height, weight & more',
              style: TextStyle(color: Color(0xFF555555), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
