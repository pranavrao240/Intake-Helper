import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:intake_helper/Providers/meal_suggestion_history_provider.dart';
import 'package:intake_helper/models/meal_suggestion_history_model.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/ai_meal_planner_screen.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/drawer/chat_drawer_header.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/drawer/drawer_action_tile.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/drawer/drawer_search_tile.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/drawer/recent_chat_section.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/drawer/recent_chat_tile.dart';
import 'package:intake_helper/pages/Ai%20meal%20planner/widgets/drawer/drawer_bottom_actions.dart';
import 'package:intake_helper/utils/message_type.dart';
import 'package:intake_helper/services/onboarding_tutorial_service.dart';
import 'package:share_plus/share_plus.dart';

String _cleanResponse(String response) {
  final cleanThink = response.replaceAll(RegExp(r'<think>[\s\S]*?<\/think>'), '').trim();
  return cleanThink
      .replaceAll(
        RegExp(
          r'Meal Image only one image should be given:\s*\n?',
          caseSensitive: false,
        ),
        '',
      )
      .replaceAll(RegExp(r'!\[.*?\]\(.*?\)'), '')
      .replaceAll(RegExp(r'\n{3,}'), '\n\n')
      .trim();
}

class CustomChatDrawer extends HookConsumerWidget {
  const CustomChatDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width * 0.82;
    final drawerWidth = width > 340.0 ? 340.0 : width;

    // Fetch history list when drawer is opened
    useEffect(() {
      Future.microtask(() {
        ref
            .read(mealSuggestionHistoryProvider.notifier)
            .getHistory(page: 1, limit: 50);
      });
      return null;
    }, const []);

    // Trigger Drawer Tutorial when drawer mounts
    useEffect(() {
      Future.microtask(() async {
        final step = await OnboardingTutorialService.getStep();
        if (step == 'drawer' && context.mounted) {
          // Allow drawer slide-in animation to complete
          await Future.delayed(const Duration(milliseconds: 400));
          if (context.mounted) {
            OnboardingTutorialService.showDrawerTutorial(context);
          }
        }
      });
      return null;
    }, const []);

    final historyStateAsync = ref.watch(mealSuggestionHistoryProvider);
    final historyList = historyStateAsync.value?.historyList ?? [];

    // State for filtering recent chats
    final searchQuery = useState<String>('');

    final filteredHistoryList = useMemoized(() {
      if (searchQuery.value.isEmpty) {
        return historyList;
      }
      final query = searchQuery.value.toLowerCase();
      return historyList
          .where((item) => item.prompt.toLowerCase().contains(query))
          .toList();
    }, [historyList, searchQuery.value]);

    // Grouping logic for history list
    final groupedChats = useMemoized(() {
      final Map<String, List<MealSuggestionHistoryModel>> groups = {};
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(const Duration(days: 1));

      for (final item in filteredHistoryList) {
        final date = item.createdAt;
        final itemDate = DateTime(date.year, date.month, date.day);
        String key;
        if (itemDate == today) {
          key = 'TODAY';
        } else if (itemDate == yesterday) {
          key = 'YESTERDAY';
        } else {
          key = DateFormat('d MMMM').format(date).toUpperCase();
        }

        if (!groups.containsKey(key)) {
          groups[key] = [];
        }
        groups[key]!.add(item);
      }
      return groups;
    }, [filteredHistoryList]);

    // To track selected suggestion id visually (simulate active state)
    final selectedId = useState<String?>(null);

    void onChatTileTap(MealSuggestionHistoryModel item) {
      selectedId.value = item.id;

      // Load selected history messages into the chat screen
      ref.read(chatMessagesProvider.notifier).setMessages([
        ChatMessage(item.prompt, MessageType.user),
        ChatMessage(item.response.toString(), MessageType.ai),
      ]);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Loaded history item: "${item.prompt}"'),
          duration: const Duration(seconds: 2),
        ),
      );

      Navigator.pop(context); // Close the drawer
    }

    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: const Color(0xFF000000),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header section
              ChatDrawerHeader(
                onClose: () => Navigator.pop(context),
              ),
              const SizedBox(height: 8),

              // Top Primary Actions
              Container(
                key: OnboardingTutorialService.drawerNewChatKey,
                child: DrawerActionTile(
                  icon: Icons.edit_square,
                  label: 'New Chat',
                  onTap: () {
                    // Clear existing messages to start a new chat
                    ref.read(chatMessagesProvider.notifier).clearMessages();
                    selectedId.value = null;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('New conversation started')),
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
              DrawerSearchTile(
                onChanged: (String value) {
                  searchQuery.value = value;
                },
                onClear: () {
                  searchQuery.value = '';
                },
              ),

              const SizedBox(height: 12),

              // Scrollable Recent Chats List
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    // Recents Label
                    Padding(
                      key: OnboardingTutorialService.drawerHistoryKey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.history_rounded,
                            color: Colors.white.withOpacity(0.4),
                            size: 14,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Recents',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (historyStateAsync.isLoading && historyList.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: CircularProgressIndicator(
                            color: Colors.white24,
                            strokeWidth: 2.5,
                          ),
                        ),
                      )
                    else if (historyList.isEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            'No recent suggestions',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                    else
                      ...groupedChats.entries.map((entry) {
                        return RecentChatSection(
                          title: entry.key,
                          children: entry.value.map((item) {
                            return RecentChatTile(
                              title: item.prompt,
                              time:
                                  DateFormat('hh:mm a').format(item.createdAt),
                              isSelected: selectedId.value == item.id,
                              onTap: () => onChatTileTap(item),
                              onDelete: () {
                                ref
                                    .read(
                                        mealSuggestionHistoryProvider.notifier)
                                    .deleteHistoryItem(id: item.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Chat deleted successfully')),
                                );
                              },
                              onShare: () {
                                final cleanResponse = _cleanResponse(item.response.toString());
                                final shareText = 'this meal were generated by "Intake helper"  here the download link https://play.google.com/store/apps/details?id=com.pranavrao.intake_helper\n\n'
                                    'Prompt: ${item.prompt}\n\n'
                                    'Response:\n$cleanResponse';
                                Share.share(shareText);
                              },
                            );
                          }).toList(),
                        );
                      }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Bottom pinned actions
              const DrawerBottomActions(),
            ],
          ),
        ),
      ),
    );
  }
}
