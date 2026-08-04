import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/groq_service.dart';

final groqProvider = AsyncNotifierProvider<GroqService, GroqState>(
  GroqService.new,
);
