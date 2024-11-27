import 'package:eommerce_app/model/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../model/cleaning_service.dart';

class SupabaseService {
  static final supabase = Supabase.instance.client;

  static Future<Result<List<CleaningService>>> getAllCleaningServices() async {
    try {
      final response = await supabase.from('cleaning_service').select();

      List<CleaningService> services = response.map((json) {
        return CleaningService.fromJson(json);
      }).toList();

      return Result.success(services);
    } catch (e) {
      return Result.error('$e');
    }
  }
}
