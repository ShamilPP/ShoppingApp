import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider = StateNotifierProvider<HomeNavigationNotifier, int>((ref) => HomeNavigationNotifier());

class HomeNavigationNotifier extends StateNotifier<int> {
  HomeNavigationNotifier() : super(0);

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}
