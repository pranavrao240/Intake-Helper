import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/components/bottom_navbar.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20list/widgets/nutrition_item_card.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20list/widgets/nutrition_list_header.dart';
import 'package:intake_helper/pages/nutritions/nutrition%20list/widgets/nutrition_search_bar.dart';

class NutritionScreen extends HookConsumerWidget {
  const NutritionScreen({super.key});

  static const int _pageSize = 15;

  List<Nutrition> _filterData(List<Nutrition> data, String query) {
    if (query.isEmpty) return data;
    return data
        .where((item) =>
            item.dishName?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.read(apiServiceProvider.notifier);
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final nutritions = useState<List<Nutrition>>([]);
    final isLoading = useState(true);
    final isLoadingMore = useState(false);
    final error = useState<String?>(null);
    final visibleCount = useState(_pageSize);

    // Initial data load
    useEffect(() {
      api.getNutritions().then((value) {
        nutritions.value = value;
        isLoading.value = false;
      }).catchError((e) {
        error.value = e.toString();
        isLoading.value = false;
      });
      return null;
    }, []);

    // Reset pagination when search query changes
    useEffect(() {
      visibleCount.value = _pageSize;
      return null;
    }, [searchQuery.value]);

    final filtered = _filterData(nutritions.value, searchQuery.value);
    final visible = filtered.take(visibleCount.value).toList();
    final hasMore = visibleCount.value < filtered.length;
    final remaining = filtered.length - visibleCount.value;

    Future<void> loadMore() async {
      isLoadingMore.value = true;
      await Future.delayed(const Duration(milliseconds: 400));
      visibleCount.value += _pageSize;
      isLoadingMore.value = false;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: CustomScrollView(
        slivers: [
          // ── Hero header with overlapping search bar ──
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const NutritionListHeader(),
                Positioned(
                  bottom: -24,
                  left: 20,
                  right: 20,
                  child: NutritionSearchBar(
                    controller: searchController,
                    onChanged: (v) => searchQuery.value = v,
                  ),
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 44)),

          // ── Loading ──
          if (isLoading.value)
            const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(color: Color(0xFF3B82F6)),
              ),
            )

          // ── Error ──
          else if (error.value != null)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline,
                        color: Colors.white.withValues(alpha: 0.3), size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Failed to load nutrition data',
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            )

          // ── Empty ──
          else if (filtered.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search_off,
                        color: Colors.white.withValues(alpha: 0.2), size: 48),
                    const SizedBox(height: 12),
                    Text(
                      searchQuery.value.isEmpty
                          ? 'No nutrition data found'
                          : 'No results for "${searchQuery.value}"',
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.4),
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            )

          // ── Results ──
          else ...[
            // Results count label
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Text(
                  'Showing ${visible.length} of ${filtered.length} results',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Card grid
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => NutritionItemCard(item: visible[index]),
                  childCount: visible.length,
                ),
              ),
            ),

            // Load more / end indicator
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
                child: hasMore
                    ? _LoadMoreButton(
                        remaining: remaining,
                        pageSize: _pageSize,
                        isLoading: isLoadingMore.value,
                        onTap: loadMore,
                      )
                    : _EndIndicator(total: filtered.length),
              ),
            ),
          ],
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

// ── Load More Button ─────────────────────────────────────────────────────────
class _LoadMoreButton extends StatelessWidget {
  final int remaining;
  final int pageSize;
  final bool isLoading;
  final VoidCallback onTap;

  const _LoadMoreButton({
    required this.remaining,
    required this.pageSize,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final loadCount = remaining.clamp(0, pageSize);

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isLoading
              ? const Color(0xFF18181B)
              : const Color(0xFF1D4ED8).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isLoading
                ? Colors.white.withValues(alpha: 0.06)
                : const Color(0xFF3B82F6).withValues(alpha: 0.35),
          ),
        ),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Color(0xFF3B82F6),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.expand_more_rounded,
                    color: Color(0xFF3B82F6),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Load $loadCount more',
                    style: const TextStyle(
                      color: Color(0xFF3B82F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$remaining left',
                      style: TextStyle(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.8),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// ── End of results indicator ─────────────────────────────────────────────────
class _EndIndicator extends StatelessWidget {
  final int total;
  const _EndIndicator({required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.08))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'All $total results shown',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.25),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.08))),
      ],
    );
  }
}
