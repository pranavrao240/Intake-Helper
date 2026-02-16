import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intake_helper/api/openAi_service.dart';

final openAiProvider = AsyncNotifierProvider<OpenAiService, OpenAiState>(
  OpenAiService.new,
);
