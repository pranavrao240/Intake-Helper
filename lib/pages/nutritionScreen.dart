import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intake_helper/api/api_service.dart';
import 'package:intake_helper/models/nutrition_model.dart';
import 'package:intake_helper/widgets/top_bar.dart';

class NutritionScreen extends ConsumerStatefulWidget {
  const NutritionScreen({super.key});

  @override
  ConsumerState<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends ConsumerState<NutritionScreen> {
  final SearchController _searchController = SearchController();
  String _searchQuery = "";

  List<Nutrition> _filterData(List<Nutrition> data) {
    if (_searchQuery.isEmpty) return data;
    return data
        .where((item) =>
            item.dishName?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
            false)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final api = ref.read(apiservice);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: customAppbar(
        context,
        title: "Nutrition Tracker",
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SearchAnchor(
              searchController: _searchController,
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  hintText: "Search Meals or Nutrients",
                  elevation: MaterialStateProperty.all(0),
                  hintStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.grey),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF2A2A2A)),
                  surfaceTintColor:
                      MaterialStateProperty.all(Colors.transparent),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.white),
                  ),
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 16)),
                  onSubmitted: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  leading: const Icon(Icons.search, color: Colors.white),
                );
              },
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return const [];
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Nutrition>?>(
              future: api.getNutritions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.redAccent)),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No nutrition data found.",
                        style: TextStyle(color: Colors.white70)),
                  );
                } else {
                  final filteredData = _filterData(snapshot.data!);

                  if (filteredData.isEmpty) {
                    return const Center(
                      child: Text("No matching results.",
                          style: TextStyle(color: Colors.white70)),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final item = filteredData[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            item.dishName ?? '',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Calories: ${item.calories}  •  Protein: ${item.protein}g",
                            style: const TextStyle(
                                color: Color(0xFF00FFAA), fontSize: 13),
                          ),
                          trailing: const Icon(Icons.fitness_center,
                              color: Colors.white),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              "/meal-details",
                              arguments: {'_id': item.id},
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
