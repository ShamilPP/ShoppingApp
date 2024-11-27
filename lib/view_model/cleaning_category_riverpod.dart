import 'package:flutter_riverpod/flutter_riverpod.dart';

final cleaningCategoryProvider = StateNotifierProvider<CleaningCategoryNotifier, String>((ref) => CleaningCategoryNotifier());

class CleaningCategoryNotifier extends StateNotifier<String> {
  /// Default category is "Deep cleaning"
  CleaningCategoryNotifier() : super('Deep cleaning');

  void updateCategory(String category) {
    state = category;
  }
}
