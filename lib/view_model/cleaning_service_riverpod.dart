import 'package:eommerce_app/model/cleaning_service.dart';
import 'package:eommerce_app/model/result.dart';
import 'package:eommerce_app/services/remote/supabase/supabase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cleaningServiceProvider = StateNotifierProvider<CleaningServiceNotifier, Result<List<CleaningService>>>((ref) => CleaningServiceNotifier());

class CleaningServiceNotifier extends StateNotifier<Result<List<CleaningService>>> {
  CleaningServiceNotifier() : super(Result.initial());

  void loadCleaningService() async {
    state = Result.loading();
    try {
      state = await SupabaseService.getAllCleaningServices();
    } catch (e) {
      state = state.copyWith(status: ResultStatus.failed);
    }
  }
}
