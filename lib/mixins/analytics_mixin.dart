import 'package:flutter/widgets.dart';
import 'package:intake_helper/analytics_service.dart';

mixin AnalyticsMixin<T extends StatefulWidget> on State<T> {
  String get screenName;

  @override
  void initState() {
    super.initState();
    // Track screen view when widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AnalyticsService.trackScreenView(screenName);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Track screen view when dependencies change (navigation)
    AnalyticsService.trackScreenView(screenName);
  }
}
