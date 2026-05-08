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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.read(apiServiceProvider.notifier);
    final searchController = useTextEditingController();
    final searchQuery = useState('');
    final nutritions = useState<List<Nutrition>>([]);
    final isLoading = useState(true);
    final isLoadingMore = useState(false);
    final error = useState<String?>(null);
    final currentPage = useState(1);
    final hasMorePages = useState(true);
    // Track in-flight search to cancel stale results
    final searchVersion = useRef(0);

    Future<void> loadInitialData({bool forceRefresh = false}) async {
      final hasCachedData = nutritions.value.isNotEmpty && !forceRefresh;
      try {
        error.value = null;
        isLoading.value = true;
        if (!hasCachedData) {
          currentPage.value = 1;
          hasMorePages.value = true;
        }
        final data = await api.getNutritions(
            page: 1, limit: _pageSize, reset: !hasCachedData);
        if (!hasCachedData || data.isNotEmpty) {
          nutritions.value = data;
        }
        hasMorePages.value = data.length >= _pageSize;
      } catch (e) {
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }

    Future<void> loadMore() async {
      if (isLoadingMore.value || !hasMorePages.value) return;
      try {
        isLoadingMore.value = true;
        currentPage.value++;
        final newData = await api.getNutritions(
          page: currentPage.value,
          limit: _pageSize,
        );
        nutritions.value = [...nutritions.value, ...newData];
        if (newData.length < _pageSize) hasMorePages.value = false;
      } catch (e) {
        error.value = e.toString();
        currentPage.value--;
      } finally {
        isLoadingMore.value = false;
      }
    }

    Future<void> searchNutritions(String query) async {
      if (query.isEmpty) {
        await loadInitialData(forceRefresh: true);
        return;
      }

      searchVersion.value++;
      final myVersion = searchVersion.value;

      try {
        error.value = null;
        isLoading.value = true;

        final data = await api.getNutritions(
          page: 1,
          limit: _pageSize,
          search: query,
        );

        if (searchVersion.value != myVersion) return;

        nutritions.value = data;
        currentPage.value = 1;
        hasMorePages.value = data.length >= _pageSize;
      } catch (e) {
        if (searchVersion.value == myVersion) error.value = e.toString();
      } finally {
        if (searchVersion.value == myVersion) isLoading.value = false;
      }
    }

    useEffect(() {
      Future.microtask(() => loadInitialData());
      return null;
    }, const []);

    useEffect(() {
      bool cancelled = false;
      Future.delayed(const Duration(milliseconds: 400), () {
        if (!cancelled) {
          if (searchQuery.value.isEmpty) {
            loadInitialData(forceRefresh: true);
          } else {
            searchNutritions(searchQuery.value);
          }
        }
      });
      return () => cancelled = true;
    }, [searchQuery.value]);

    final hasMore = hasMorePages.value;
    final displayedNutritions = nutritions.value;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: RefreshIndicator(
        onRefresh: () => loadInitialData(forceRefresh: true),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const NutritionListHeader(),
                  Positioned(
                    bottom: -24,
                    left: 20,
                    right: 20,
                    child: ValueListenableBuilder<TextEditingValue>(
                      valueListenable: searchController,
                      builder: (context, value, child) {
                        return NutritionSearchBar(
                          controller: searchController,
                          onChanged: (v) => searchQuery.value = v,
                          onClear: () {
                            searchController.clear();
                            searchQuery.value = '';
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 44)),
            if (isLoading.value)
              const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(color: Color(0xFF3B82F6)),
                ),
              )
            else if (error.value != null)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.error_outline,
                          color: Colors.white.withValues(alpha: 0.3), size: 48),
                      const SizedBox(height: 12),
                      Text('Failed to load nutrition data',
                          style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              fontSize: 14)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => loadInitialData(forceRefresh: true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              )
            else if (displayedNutritions.isEmpty)
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
            else ...[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: Text(
                    'Showing ${displayedNutritions.length} results',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.3),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
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
                    (context, index) =>
                        NutritionItemCard(item: displayedNutritions[index]),
                    childCount: displayedNutritions.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
                  child: hasMore
                      ? _LoadMoreButton(
                          isLoading: isLoadingMore.value, onTap: loadMore)
                      : _EndIndicator(total: displayedNutritions.length),
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

class _LoadMoreButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;

  const _LoadMoreButton({
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.expand_more_rounded,
                    color: Color(0xFF3B82F6),
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Load more',
                    style: TextStyle(
                      color: Color(0xFF3B82F6),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

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
